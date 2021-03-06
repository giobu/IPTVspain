#!/bin/bash

#/**
# * @file install.sh
# * @brief install/update WebGrab+Plus
# * @author Francis De Paemeleere
# * @date 05/11/2016
# */

#backup the current working dir
WG_BCKP_DIR="$(pwd)"

function quit {
    #restore previous working dir
    cd "$WG_BCKP_DIR"
    exit $1;
}

#check if the siteini.pack.update can be seen
if [ -d "siteini.pack.update" ]
then
	if [ -d "siteini.pack" ]
	then
	    echo " ==> update siteini.pack"
		rm -rf siteini.pack
		mv siteini.pack.update siteini.pack
	else
	    echo " ==> installing siteini.pack"
	    mv siteini.pack.update siteini.pack
	fi
fi

#check if the WebGrab++.config.example.xml needs to be installed
if [ ! -f "WebGrab++.config.xml" ]
then
    echo " ==> installing WebGrab++.config.xml"
    cp WebGrab++.config.example.xml WebGrab++.config.xml
fi

#check if the mdb.config.example.xml needs to be installed
if [ ! -f "mdb/mdb.config.xml" ]
then
    echo " ==> installing mdb/mdb.config.xml"
    cp mdb/mdb.config.example.xml mdb/mdb.config.xml
fi

#check if the rex.config.example.xml needs to be installed
if [ ! -f "rex/rex.config.xml" ]
then
    echo " ==> installing rex/rex.config.xml"
    cp rex/rex.config.example.xml rex/rex.config.xml
fi

echo " ==> DONE"


quit 0;

