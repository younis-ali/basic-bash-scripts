#! /usr/bin/bash
: ' This bash script accepts the url
    then converts that url into an IP address using dig command.
    Then uses ipinfo.io using curl. 
    Response from the curl contains details of given ip address
    like city, regiion etc.
    please note jq the command line json processor should be installed.
'

echo "Enter a URL:"
read -r url

# Resolve the domain name to an IP address using dig
ip_address=$(dig +short "$url" | head -n 1)

if [ -z "$ip_address" ]; then
    echo "Could not resolve IP address for the URL."
    exit 1
fi

# Make a GET request to ipinfo.io to fetch geolocation information
response=$(curl -s "ipinfo.io/$ip_address")

# Extract and display relevant information from the response
city=$(echo "$response" | jq -r '.city')
region=$(echo "$response" | jq -r '.region')
country=$(echo "$response" | jq -r '.country')
org=$(echo "$response" | jq -r '.org')

echo "URL: $url"
echo "IP Address: $ip_address"
echo "City: $city"
echo "Region: $region"
echo "Country: $country"
echo "Organization: $org"
