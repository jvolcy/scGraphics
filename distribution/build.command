#!/bin/bash

#script to build and install scGraphics.  For details on
#creating and installing packages, see
#https://packaging.python.org/tutorials/packaging-projects/

#go to the script's directory
cd -- "$(dirname "$0")"

#get the version number
#read -p 'Enter the version (e.g: 2.1-001): ' sc_version
sc_version=`grep -e "@@SCVERSION" ../scgraphics.py | awk 'BEGIN { FS = "\"" } ; { print $2 }'`

echo
echo "SC Version is $sc_version"


if [ -d "distros/$sc_version" ]; then
	echo ""
	echo ""
	echo "************************* WARNING *************************"
	echo " The directory distros/$sc_version already exists."
	echo " This process will overwrite the contents of this directory."
	echo "***********************************************************"
	echo ""
	read -p "Overwrite? (y/n)"

	if [ "$REPLY" != "y" ]; then
		echo "Aborting..."
		exit 0
	fi

fi


#create the scGraphics package
cd package
python3 setup.py sdist
cd ..

#make the distribution directory
mkdir "distros/$sc_version"

#copy files to distros directory
cp "install_scripts/Install (Mac).command" "distros/$sc_version"
cp "install_scripts/Install (Win).bat" "distros/$sc_version"
cp "package/dist/scgraphics-2.1.tar.gz" "distros/$sc_version"

#make a zip file
cd distros
tar cz "$sc_version" > "$sc_version.tar.gz"


