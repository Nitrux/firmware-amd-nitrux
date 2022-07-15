#!/bin/bash

### Basic Packages
apt -qq -yy install equivs git devscripts lintian --no-install-recommends

### Install Dependencies
mk-build-deps -i -t "apt-get --yes" -r

### Build Deb
mkdir source
mv ./* source/ # Hack for debuild
cd source
debuild -b -uc -us
cd ../

pwd; ls -l # here be the fucking deb

mv *.deb 