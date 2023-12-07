#!/bin/bash

Help(){
	echo "pwndocker - v0.0.1";
	echo "Usage: ./$(basename "$0") <libc-version> <image-name>";
	echo "";
	echo "Available libc versions:";
	echo "  - 2.23";
	echo "  - 2.27";
	echo "  - 2.31";
	echo "  - 2.35";
	echo "To build all images, run: ./$(basename "$0") all";
	echo "Default image names are 'pwndocker:libc-<version>'";
}


if [ $# -eq "0" ];
then
	Help;
	exit 1
fi

if [ "$1" = "all" ]; then
	for d in src/*/; do
		echo "[-] Building ${d%/} image...";
		trimmed_version="${d#src/}"
		trimmed_version="${trimmed_version%/}"
		# echo "docker build $d -t pwndocker:libc-$trimmed_version";
		docker build $d -t pwndocker:libc-$trimmed_version;

		if [ $? -eq "0" ]; then
			echo "[+] $d Build complete!";
		else
			echo "[-] Build failed!";
			exit 1
		fi
	done
	exit 0
fi

# echo docker build ./$1 -t $2;
docker build ./src/$1 -t $2

if [ $? -eq "0" ];
then
	echo "[-] Build complete!";
	exit 0
fi
echo "[+] Build failed!"
