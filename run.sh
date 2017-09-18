#!/bin/bash

SCRIPT_FOLDER="$( cd "$( dirname "$0" )"; pwd -P )" 
docker run -it `basename $SCRIPT_FOLDER`

