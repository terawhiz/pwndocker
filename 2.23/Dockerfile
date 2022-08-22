FROM ubuntu:16.04

ENV DEBIAN_FRONTEND noninteractive
ENV LC_CTYPE=C.UTF-8

RUN dpkg --add-architecture i386
RUN apt-get update && \
	dpkg -l | grep ^ii | cut -d' ' -f3 | grep -v '^libgcc-s1:amd64$' | xargs apt-get install -y --reinstall && \
	apt-get install -y sudo \
		build-essential \
		git \
		nasm \
		libc6-dbg \
		libc6-dbg:i386 \
		gcc-multilib \
		gdb \
		gcc \
		wget \
		curl \
		zsh \
		ltrace \
		strace \
		cmake \
		socat \
		netcat \
		ruby \
		vim \
		libc6:i386 libncurses5:i386 libstdc++6:i386 && \
		apt-get clean

RUN apt-get install -y python python-pip python-dev libssl-dev libffi-dev
RUN python2 -m pip install --upgrade pip==20.3.4
RUN python2 -m pip install --upgrade setuptools wheel

RUN pip install --force-reinstall git+https://github.com/Gallopsled/pwntools#egg=pwntools
RUN git clone https://github.com/pwndbg/pwndbg /opt/pwndbg && \
	echo "source /opt/pwndbg/gdbinit.py" > ~/.gdbinit


RUN echo 'shunt{OP}' > /flag

VOLUME ["/share"]
WORKDIR /share
