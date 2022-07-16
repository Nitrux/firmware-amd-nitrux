#! /bin/bash

set -x

### Basic Packages
apt -qq -yy install equivs git devscripts lintian --no-install-recommends

### Install Dependencies
mk-build-deps -i -t "apt-get --yes" -r

### Build Deb
debuild -b -uc -us

pwd; ls -l