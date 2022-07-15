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

pwd; ls -l
cd ../
pwd; ls -l
cd ../
pwd; ls -l

find .. -maxdepth 1 -type f -not -path '*/\.*' | sed 's/^\.\///g' | sort
