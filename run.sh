#1/bin/sh

Help(){
	echo "pwndocker - v0.0.1";
	echo "Usage: ./$(basename "$0") <image-name> <container-name>";
	echo;
	echo NOTE: Run this script from the directory where you wanna work with
}


if [ $# -eq "0" ];
then
	Help;
	exit 1
fi

echo "Run: docker exec -it test /bin/bash"
docker run --rm -v $PWD:/ctf --cap-add=SYS_PTRACE --security-opt seccomp=unconfined --name $2 -it $1

