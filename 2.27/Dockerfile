FROM ubuntu:18.04

ENV DEBIAN_FRONTEND noninteractive
ENV LC_CTYPE=C.UTF-8


RUN dpkg --add-architecture i386
RUN apt-get update --fix-missing -y
RUN apt-get install -y apt-utils software-properties-common
RUN apt-get install -y sudo \
			   build-essential \
			   git \
			   gdb \
			   gdb-multiarch \
			   python3-dev \
			   python3-pip \
			   libssl-dev \
			   libffi-dev \
			   build-essential \
			   net-tools \
			   nasm \
			   libtool \
			   cmake \
			   tmux \
			   vim \
			   strace \
			   ltrace \
			   autoconf \
			   socat \
			   netcat \
			   curl \
			   wget \
			   tcpdump \
			   binutils \
			   diffutils \
			   elfutils \
			   psutils \
			   unzip \
			   man-db \
			   manpages-dev 

# pwntools
RUN python3 -m pip install --upgrade pip
RUN python3 -m pip install --upgrade pwntools

# pwndbg
RUN git clone https://github.com/pwndbg/pwndbg /opt/pwndbg && \
	cd /opt/pwndbg && \
	./setup.sh
# gef - just in case
RUN wget -O ~/.gdbinit-gef.py -q https://gef.blah.cat/py

# zsh
RUN apt-get install -y zsh
RUN sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
RUN echo "export ZSH="\$HOME/.oh-my-zsh"\nZSH_THEME="fishy"\nplugins=(git)\nsource \$ZSH/oh-my-zsh.sh" > ~/.zshrc

RUN apt-get clean
RUN echo "shunt{OP}" > /flag
WORKDIR /ctf
CMD ["/bin/zsh"]
