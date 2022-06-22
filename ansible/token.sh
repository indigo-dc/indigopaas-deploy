#!/bin/bash
read -p 'Username: ' uservar
read -sp 'Password: ' passvar
printf "\n"
export MY_IAM_PASSWORD="${passvar}"
export MY_IAM_USERNAME="${uservar}"

#costa@CNAF
#export IAM_CLIENT_ID=6b5c9ead-cd4d-4379-94d5-eaaf6f033c45
#export IAM_CLIENT_SECRET=CUGcmmzvJ6Z7n22DYo8Je5NSrGlJ45l92r7RatZLOhm2HhUSBk0MWdgQ52Y7PXWjlQYZfoU3-mwhV6TPvUBXCg

#costa@iotwins
export IAM_CLIENT_ID=eba021e5-9101-4a22-a086-76ee1414f691
export IAM_CLIENT_SECRET=ALoKwP3uXXiZw2Ob1qbSEgW3IUSf0fAjiL9TK1mlhmdwkaBbYQGx3kUvJ62fldfZq2Z8WFmBaZP93hbsjxJH7bE

export ORCHENT_TOKEN="$(curl -s -L -u "${IAM_CLIENT_ID}:${IAM_CLIENT_SECRET}" -d grant_type=password -d scope="openid profile email offline_access" -d username=${MY_IAM_USERNAME} -d password=${MY_IAM_PASSWORD} https://iotwins-iam.cloud.cnaf.infn.it/token | jq -r .access_token)"

export IAM_ACCESS_TOKEN=$ORCHENT_TOKEN

echo "ORCHENT_TOKEN="$ORCHENT_TOKEN
echo "IAM_ACCESS_TOKEN="$IAM_ACCESS_TOKEN
