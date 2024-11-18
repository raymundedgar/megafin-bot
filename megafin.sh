#!/bin/bash

# Function to print stylized text
welcome() {
    brand=$(cat <<EOF
| |/ /_ __ _   _ _   _  | |/ /_ __ _   _ _   _
| ' /| '__| | | | | | | | ' /| '__| | | | | | |
| . \| |  | |_| | |_| | | . \| |  | |_| | |_| |
|_|\_\_|   \__,_|\__,_| |_|\_\_|   \__,_|\__,_|
EOF
)
    echo
    echo "$brand"
    echo
}

welcome

echo "Github: https://github.com/raymundedgar"
echo

TOKEN=$(<bearer.txt)
URL="https://api.megafin.xyz/users/connect"
index=1  # To handle token iteration (if multiple tokens are needed)

while true; do
    # Fetch the response from the API
    response=$(curl -s -X GET "$URL" -H "Authorization: Bearer $TOKEN" -A "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36")

    # Validate the response
    if echo "$response" | jq -e '.result.balance.MGF' > /dev/null 2>&1 &&
       echo "$response" | jq -e '.result.balance.USDC' > /dev/null 2>&1; then

        # Extract and format the balances
        mgf=$(echo "$response" | jq -r '.result.balance.MGF' | awk '{printf "%.6f", $1}')
        usdc=$(echo "$response" | jq -r '.result.balance.USDC' | awk '{printf "%.6f", $1}')

        # Print the formatted balances with the current time and a stylized message
        echo -e "\033[1;32m$(date +'%H:%M:%S')\033[0m | MGF: $mgf - USDC: $usdc"

    else
        echo "Unexpected response for token $TOKEN. Exiting."
    fi

    # Wait for all background processes to finish before continuing
    wait

    # Generate a random sleep time between 10 and 30 seconds
    sleep_time=$((RANDOM % 21 + 10))
    sleep $sleep_time
done
