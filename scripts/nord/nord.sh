#!/bin/sh
# This is a comment!
# $ chmod u+rx nord.sh

# Map Countries to Array
mapfile -t countries < ./assets/nordvpn-countries.txt
rand_index=$((RANDOM % ${#countries[@]}))
random_country=${countries[$rand_index]}
echo "Connecting to NordVPN in $random_country..."
nordvpn connect "$random_country"
# Check if the connection was successful
if [ $? -eq 0 ]; then
    echo "Successfully connected to NordVPN in $random_country."
else
    echo "Failed to connect to NordVPN in $random_country."
    exit 1
fi
