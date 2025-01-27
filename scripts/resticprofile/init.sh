#!/bin/bash

# initialize all repositories
REPOSITORIES_CSV=$(yq 'with_entries(select(.value | has("repository")))' /etc/resticprofile/profiles.yaml | yq 'keys | join(",")');
for PROFILE_NAME in $(echo $REPOSITORIES_CSV | sed "s/,/ /g")
do
    # call your procedure/other scripts here below
    echo "Instantiating repository for profile \"$PROFILE_NAME\"";
    resticprofile --name $PROFILE_NAME init;
done
