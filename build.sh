#1/bin/sh

Help(){
	echo "pwndocker - v0.0.1";
	echo "Usage: ./$(basename "$0") <libc-version> <image-name>";
	echo "";
	echo "Available libc versions:";
	echo "  - 2.23";
	echo "  - 2.27";
	echo "  - 2.31";
	echo "  - 2.35";
}


if [ $# -eq "0" ];
then
	Help;
	exit 1
fi

# echo docker build ./$1 -t $2;
docker build ./$1 -t $2

if [ $? -eq "0" ];
then
	echo "[-] Build complete!";
	exit 0
fi
echo "[+] Build failed!"
