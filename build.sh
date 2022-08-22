#1/bin/sh

Help(){
	echo "pwndocker - v0.0.1";
	echo "Usage: ./$(basename "$0") <libc-version> <image-name>";
	echo "";
	echo "Available libc versions:";
	echo "  - 20.04";
}


if [ $# -eq "0" ];
then
	Help;
	exit 1
fi

echo docker build ./$1 -t $2;
docker build ./$1 -t $2

if [ $? -eq "1" ];
then
	echo "[-] Build failed!";
	exit 1
fi
echo "[+] Build Complete!"
