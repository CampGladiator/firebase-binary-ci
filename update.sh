#!/usr/bin/env bash
set -euxo pipefail

echo "-- Downloading latest firebase binary..."
curl -Lo ./firebase https://firebase.tools/bin/macos/latest

echo "-- Compressing firebase binary..."
XZ_OPT=-9e tar cJf firebase.tar.xz firebase

echo "-- Deleting uncompressed binary..."
rm firebase

echo "-- Pushing new firebase binary..."
git config --global user.name "Pedro Guimarães"
git config --global user.email "moisespedro15@gmail.com"
git add .
git commit -m "Updated: `date +'%Y-%m-%d %H:%M:%S'`"
git push

exit 0