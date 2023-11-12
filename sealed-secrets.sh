#!/bin/bash

# exit when any command fails
set -e

rm environments/staging/my-app/users/secret.yml
rm environments/staging/my-app/albums/secret.yml

kubeseal --controller-name sealed-secrets -o yaml -n default  < ignore/secrets-albums.yml > environments/staging/my-app/users/secret.yml
kubeseal --controller-name sealed-secrets -o yaml -n default  < ignore/secrets-users.yml > environments/staging/my-app/albums/secret.yml
