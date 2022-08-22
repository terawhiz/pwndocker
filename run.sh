#1/bin/sh

Help(){
	echo "pwndocker - v0.0.1";
	echo "Usage: ./$(basename "$0") <image-name> <container-name>";
	echo "";
	echo "Available libc versions:";
	echo "  - 20.04";
	echo;
	echo NOTE: Run this script from the directory where you wanna work with
}


if [ $# -eq "0" ];
then
	Help;
	exit 1
fi

echo docker run --rm -v $PWD:/pwd --cap-add=SYS_PTRACE --security-opt seccomp=unconfined --name $1 -i $2;
docker run --rm -v $PWD:/share --cap-add=SYS_PTRACE --security-opt seccomp=unconfined --name $1 -i $2
