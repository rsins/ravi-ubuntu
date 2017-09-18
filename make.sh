#!/bin/bash

SCRIPT_FOLDER="$( cd "$( dirname "$0" )"; pwd -P )" 
docker build -t `basename $SCRIPT_FOLDER` $SCRIPT_FOLDER/

