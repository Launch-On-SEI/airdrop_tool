#!/bin/bash

# Define starting NFT ID
current_token_id=0
account_name="ACCOUNT_NAME" # replace this with your actual account name
contract_address="CONTRACT_ADDRESS" # Replace with your contract address for collection being airdropped

# Check if the CSV file path is provided
if [ "$#" -ne 1 ]; then
    echo "Usage: $0 path_to_csv_file"
    exit 1
fi

csv_file="$1"

# Read each line from the CSV file
while IFS=, read -r nft_number receiver_address || [ -n "$nft_number" ]
do
    for ((i=1; i<=nft_number; i++))
    do
        # Define RECEIVER_ID and CURRENT_TOKEN_ID for clarity in command
        RECEIVER_ID="$receiver_address"
        CURRENT_TOKEN_ID="$current_token_id"

        echo "attempting to send $current_token_id"
        # Execute the command and capture the response
        response=$(seid tx wasm execute $contract_address '{"transfer_nft":{"recipient":"'"$RECEIVER_ID"'","token_id":"'"$CURRENT_TOKEN_ID"'"}}' --chain-id pacific-1 --node https://rpc.ankr.com/sei --from $account_name --gas=235329 --fees=23533usei --broadcast-mode=block -y)

        # Check if the response includes "code: 19"
        if echo "$response" | grep -q "code: 19"; then
            # If it does, save as success
            echo "success on sending $current_token_id"
        else
            # If it does not, save as fail
            echo "potential issue sending $current_token_id or no success response"
            echo "$receiver_address" > "check_$CURRENT_TOKEN_ID.txt"
        fi

        # Wait for 2 seconds after each NFT transaction
        sleep 2

        # Increment the current token ID
        ((current_token_id++))
    done

done < "$csv_file"
