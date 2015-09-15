#!/bin/bash
# Copyright (C) 2015 Midokura SARL.
# All Rights Reserved.
#
#    Licensed under the Apache License, Version 2.0 (the "License"); you may
#    not use this file except in compliance with the License. You may obtain
#    a copy of the License at
#
#         http://www.apache.org/licenses/LICENSE-2.0
#
#    Unless required by applicable law or agreed to in writing, software
#    distributed under the License is distributed on an "AS IS" BASIS, WITHOUT
#    WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. See the
#    License for the specific language governing permissions and limitations
#    under the License.

set -o errexit
set -o xtrace

SRC_NAME=networking-midonet
BUILD_DIR=$HOME/debbuild
rm -rf $BUILD_DIR
mkdir $BUILD_DIR

# Get the version number
FULL_VERSION=$(dpkg-parsechangelog --show-field Version)
VERSION=$(expr "$FULL_VERSION" : '.*:\(.*\)-.*')

# Copy the tarball
cp ./${SRC_NAME}-*.tar.gz ${BUILD_DIR}/${SRC_NAME}_${VERSION}.orig.tar.gz

# Unpack the tarball
SRC_DIR=$(tar xvzf ./${SRC_NAME}-*.tar.gz -C ${BUILD_DIR} | sed -e 's@/.*@@' | uniq)

# Copy over the debian directory
cp -r ./debian $BUILD_DIR/$SRC_DIR

# Generate the package
cd $BUILD_DIR/$SRC_DIR
debuild -us -uc
cd -

# Copy the debs to the current directory
cp -r $BUILD_DIR/*.deb .
