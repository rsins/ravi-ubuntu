#!/bin/bash

SCRIPT_FOLDER="$( cd "$( dirname "$0" )"; pwd -P )" 
SCRIPT="docker run -it `basename $SCRIPT_FOLDER`"

echo $SCRIPT
$SCRIPT

