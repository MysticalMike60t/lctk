#!/bin/bash

which dos2unix &> /dev/null || sudo apt install dos2unix

dos2unix *.sh
dos2unix scripts/**/*.sh
dos2unix lib/*.sh