#!/bin/bash

# exit when any command fails
set -e

rm environments/staging/my-app/1-sealed-*

kubeseal --controller-name sealed-secrets -o yaml -n default  < ignore/1-secrets-albums.yml > environments/staging/my-app/1-sealed-secrets-albums.yml
kubeseal --controller-name sealed-secrets -o yaml -n default  < ignore/1-secrets-users.yml > environments/staging/my-app/1-sealed-secrets-users.yml
