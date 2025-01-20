#!/bin/bash

email="$BITWARDEN_USER"
password="$BITWARDEN_PW"

BW_SESSION=$(bw login --apikey --raw)
export BW_SESSION

if [ -z "$BW_SESSION" ]; then
  echo "Login failed."
  exit 1
fi

bw create user --email "$email" --password "$password"
bw logout

echo "User: $BITWARDEN_USER created!"
