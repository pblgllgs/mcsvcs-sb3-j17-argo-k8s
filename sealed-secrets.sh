#!/bin/bash

# exit when any command fails
set -e

rm environments/staging/my-app/secret-albums.yaml
rm environments/staging/my-app/secret-users.yaml

kubeseal --controller-name sealed-secrets -o yaml -n default  < ignore/secrets-users.yml > environments/staging/my-app/secret-users.yaml
kubeseal --controller-name sealed-secrets -o yaml -n default  < ignore/secrets-albums.yml > environments/staging/my-app/secret-albums.yaml
