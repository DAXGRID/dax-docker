#!/usr/bin/env bash

kortforsyning_user=$1
kortforsyning_password=$2

rm danishbasemap.geojson

wget ftp://$kortforsyning_user:$kortforsyning_password@ftp.kortforsyningen.dk//grundlaeggende_landkortdata/fot/MAPINFO/DK_MAPINFO_UTM32-EUREF89.zip -O fot.zip
unzip fot.zip -d fot
ogr2ogr -f GeoJSON -sql "SELECT 'vejkant' as objecttype FROM vejkant" -append -t_srs crs:84 danishbasemap.geojson ./fot/DK_MAPINFO_UTM32-EUREF89/FOT/TRAFIK/VEJKANT.tab -nln danishbasemap
ogr2ogr -f GeoJSON -sql "SELECT 'helle' as objecttype FROM helle" -append -t_srs crs:84 danishbasemap.geojson ./fot/DK_MAPINFO_UTM32-EUREF89/FOT/TRAFIK/HELLE.tab -nln danishbasemap

wget ftp://$kortforsyning_user:$kortforsyning_password@ftp.kortforsyningen.dk//matrikeldata/matrikelkort/MAPINFO/DK_MAPINFO_UTM32-EUREF89.zip -O matrikel.zip
unzip matrikel.zip -d matrikel
ogr2ogr -f GeoJSON -sql "SELECT 'skel' as objecttype FROM skel" -append -t_srs crs:84 danishbasemap.geojson ./matrikel/DK_MAPINFO_UTM32-EUREF89/MINIMAKS/BASIS/SKEL.tab -nln danishbasemap

docker run -it --rm \
  -v $(pwd):/data \
  openftth/tippecanoe:latest \
  tippecanoe --force --output=/data/output.mbtiles /data/danishbasemap.geojson
