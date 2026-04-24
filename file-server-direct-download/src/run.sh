#!/usr/bin/env bash

set -e

if [ "$#" -ne 5 ]; then
    echo "Usage: $0 <Url> <FileName> <OutPutPath> <Username> <Password>" >&2
    echo "Error: Incorrect number of arguments provided." >&2
    exit 1
fi

url="$1"
file_name="$2"
output="$3"
username="$4"
password="$5"

function download_file() {
    echo "Downloading file in path '$url/$file_name'."
    http_status=$(curl -sS --write-out '%{http_code}' -X GET -O --output-dir "$output" -u "$username:$password" "$url/$file_name")
    curl_exit_status=$?

    if [ "$curl_exit_status" -ne 0 ]; then
        echo "Error: curl command failed with exit status $curl_exit_status. Could not complete request to '$url'." >&2
        exit 1
    fi

    if [[ "$http_status" -ge 200 && "$http_status" -lt 300 ]]; then
        echo "Finished dowloading the file to the path '$output'. Status Code: $http_status."
    else
        echo "Error: Failed to download the file. Server responded with HTTP Status Code: $http_status" >&2
        exit 1 # Failure
    fi
}

LAST_WRITE_TIME_UTC_UNIX_TIME_STAMP=0

while /bin/true; do
    echo "Checking for new $file_name."
    response=$(curl -s -u "$username:$password" "$url?json")
    curl_exit_status=$?

    if [ "$curl_exit_status" -ne 0 ]; then
        echo "Error: curl command failed with exit status $curl_exit_status. Could not complete request to '$url'." >&2
        exit 1
    fi

    NEW_LAST_WRITE_TIME_UTC_UNIX_TIME_STAMP=$(echo $response | jq -r -c ".[] | select(.name==\"$file_name\") | .lastWriteTimeUtcUnixtimeStamp")

    if [ "$NEW_LAST_WRITE_TIME_UTC_UNIX_TIME_STAMP" -gt "$LAST_WRITE_TIME_UTC_UNIX_TIME_STAMP" ]; then  
        echo "Found change from $LAST_WRITE_TIME_UTC_UNIX_TIME_STAMP to $NEW_LAST_WRITE_TIME_UTC_UNIX_TIME_STAMP"
        download_file
        LAST_WRITE_TIME_UTC_UNIX_TIME_STAMP=$NEW_LAST_WRITE_TIME_UTC_UNIX_TIME_STAMP
    else
        echo "No changes from $LAST_WRITE_TIME_UTC_UNIX_TIME_STAMP to $NEW_LAST_WRITE_TIME_UTC_UNIX_TIME_STAMP"
    fi
 
    sleep 5
done
