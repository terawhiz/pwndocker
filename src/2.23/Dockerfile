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

# pwntools
RUN apt-get install -y python python-pip python-dev libssl-dev libffi-dev
RUN python2 -m pip install --upgrade pip==20.3.4
RUN python2 -m pip install --upgrade setuptools wheel
RUN pip install --force-reinstall git+https://github.com/Gallopsled/pwntools#egg=pwntools

# pwndbg
RUN git clone https://github.com/pwndbg/pwndbg /opt/pwndbg && \
	echo "source /opt/pwndbg/gdbinit.py" > ~/.gdbinit

# zsh
RUN apt-get install -y zsh
RUN sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
RUN echo "export ZSH="\$HOME/.oh-my-zsh"\nZSH_THEME="fishy"\nplugins=(git)\nsource \$ZSH/oh-my-zsh.sh" > ~/.zshrc

RUN apt-get clean
RUN echo 'shunt{OP}' > /flag
WORKDIR /ctf
CMD ["/bin/zsh"]
