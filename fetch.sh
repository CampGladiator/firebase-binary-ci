#!/usr/bin/env bash
set -euxo pipefail

echo "-- Creating download directory..."
INSTALL_DIR="/usr/local/bin"
sudo mkdir -p "$INSTALL_DIR"

echo "-- Fetching firebase binary..."
sudo curl https://raw.githubusercontent.com/CampGladiator/firebase-binary-ci/main/firebase.tar.xz -L --progress-bar | tar -xvz
sudo mv firebase "$INSTALL_DIR/"

echo "-- Setting permissions on binary..."
sudo chmod +rx "$INSTALL_DIR/firebase"

echo "-- Running binary for first time..."
VERSION=$("$INSTALL_DIR/firebase" --version)
echo "-- firebase-tools@$VERSION is now installed"
echo "-- All Done!"

exit 0
