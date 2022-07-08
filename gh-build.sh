#!/bin/bash

apt -qq update
apt -qq -yy install equivs git --no-install-recommends

### Install Dependencies
apt -qq -yy install devscripts lintian --no-install-recommends
mk-build-deps -i -t "apt-get --yes" -r

### Build Deb
mkdir source
mv ./* source/ # Hack for debuild
cd source
debuild -b -uc -us
