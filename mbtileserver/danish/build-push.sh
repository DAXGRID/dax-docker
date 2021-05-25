#!/usr/bin/env bash

kortforsyning_user=$1
kortforsyning_password=$2

# Create tmp folder that we can store tmp data in
mkdir -p ./tmp

# Get Vejmidte
wget ftp://$kortforsyning_user:$kortforsyning_password@ftp.kortforsyningen.dk//grundlaeggende_landkortdata/landsdaekkende-vejdata/Vejmidte-GPKG_UTM32-ETRS89.zip -O ./tmp/veje.zip
unzip -j "./tmp/veje.zip" "vejmidte_navn.gpkg" -d "./tmp/veje"
ogr2ogr -f GeoJSON -sql "SELECT geometri, 'vejmidte' as objecttype, vejnavn FROM vejmidte_navn" -append -t_srs crs:84 ./tmp/danish-basemap.geojson ./tmp/veje/vejmidte_navn.gpkg -nln danish-basemap

# Get Vejkant & Helle
wget ftp://$kortforsyning_user:$kortforsyning_password@ftp.kortforsyningen.dk//grundlaeggende_landkortdata/fot/MAPINFO/DK_MAPINFO_UTM32-EUREF89.zip -O ./tmp/fot.zip
unzip -j "./tmp/fot.zip" "DK_MAPINFO_UTM32-EUREF89/FOT/TRAFIK/VEJKANT.*" -d "./tmp/fot"
unzip -j "./tmp/fot.zip" "DK_MAPINFO_UTM32-EUREF89/FOT/TRAFIK/HELLE.*" -d "./tmp/fot"
ogr2ogr -f GeoJSON -sql "SELECT 'vejkant' as objecttype FROM vejkant" -append -t_srs crs:84 ./tmp/danish-basemap.geojson ./tmp/fot/VEJKANT.tab -nln danish-basemap
ogr2ogr -f GeoJSON -sql "SELECT 'helle' as objecttype FROM helle" -append -t_srs crs:84 ./tmp/danish-basemap.geojson ./tmp/fot/HELLE.tab -nln danish-basemap

# Get Skel
wget ftp://$kortforsyning_user:$kortforsyning_password@ftp.kortforsyningen.dk//matrikeldata/matrikelkort/MAPINFO/DK_MAPINFO_UTM32-EUREF89.zip -O ./tmp/matrikel.zip
unzip -j "./tmp/matrikel.zip" "DK_MAPINFO_UTM32-EUREF89/MINIMAKS/BASIS/SKEL.*" -d "./tmp/matrikel"
ogr2ogr -f GeoJSON -sql "SELECT 'skel' as objecttype FROM skel" -append -t_srs crs:84 ./tmp/danish-basemap.geojson ./tmp/matrikel/SKEL.tab -nln danish-basemap

# Create mbtiles
docker run -it --rm \
  -v $(pwd)/tmp:/data \
  openftth/tippecanoe:latest \
  tippecanoe --minimum-zoom=16 --maximum-zoom=16 --force --output=/data/objects.mbtiles /data/danish-basemap.geojson

# Get openmaptiles to generate danish basemap
git clone -b v3.12.2 https://github.com/openmaptiles/openmaptiles.git ./tmp/openmaptiles
cp -rf ./env-openmaptiles ./tmp/openmaptiles/.env

(cd ./tmp/openmaptiles && ./quickstart.sh denmark)

# Create tilesets folder for tilesets and move tiles to it
mkdir -p ./tilesets
cp ./tmp/objects.mbtiles ./tilesets/
cp ./tmp/openmaptiles/data/tiles.mbtiles ./tilesets/osm.mbtiles

# Remove tmp folder to increase docker build speed
rm -rf ./tmp

# Build docker image with timestamp and push it
timestamp=$(date +%s)
docker build -t openftth/mbtileserver:danish-$timestamp .
docker push openftth/mbtileserver:danish-$timestamp

# Remove tilesets since they're no longer needed
rm -rf ./tilesets/
