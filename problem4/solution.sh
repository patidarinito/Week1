#!/bin/bash

# Set the filename of the file containing the usernames and IPs
filename="users.txt"
public_key="...."
# Loop over each line in the file
while read line; do
    # Split the line into the username and IP using whitespace as the delimiter
    read -r username ip <<< "$line"
    echo "Username: $username, IP: $ip"
    
    # Do whatever you need to do with the username and IP here

    ssh $username@$ip

    # check if out public key exist in ~/.ssh/authorised_keys

    if grep -q "$public_key" "~/.ssh/authorised_keys"; then
       echo "public key already exist"
    else
       echo "$public_key" >> "~/.ssh/authorised_keys"
       echo "Public key added successfully"	

# disconnect using exit
exit
done < "$filename"
