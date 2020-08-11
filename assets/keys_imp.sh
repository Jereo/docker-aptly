#! /usr/bin/env bash

# Copyright 2018-2020 Artem B. Smirnov
# Copyright 2018 Jon Azpiazu
# Copyright 2016 Bryan J. Hong
# Licensed under the Apache License, Version 2.0

# Use: keys_imp.sh <path-to-keyring.gpg>

# Import keyrings if they exist
if [[ -f ${1} ]]; then
  # Export all public keys from a keyring or a key
  # ${1} to /opt/aptly/gpg/trustedkeys.gpg

  I=${1}
  O="/opt/aptly/gpg/trustedkeys.gpg"

  # gpg --no-options --no-default-keyring --keyring ${O} --keyserver pool.sks-keyservers.net --recv-keys 9D6D8F6BC857C906 AA8E81B4331F7F50
  # wget -O - http://repo.coex.space/aptly_repo_signing.key | \
  # gpg --no-options --no-default-keyring --keyring "/opt/aptly/gpg/trustedkeys.gpg" --import

  gpg --no-options --no-default-keyring --keyring ${I} --export | \
  gpg --no-options --no-default-keyring --keyring ${O} --import

  # gpg --no-options --no-default-keyring --keyring ${O} --list-keys
fi