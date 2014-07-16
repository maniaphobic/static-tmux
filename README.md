# Compiling tmux as a static binary

## Overview

This repo contains everything one needs to compile tmux as a
self-contained static binary, namely:

  - Source code:
	- libevent 2.0.21
	- ncurses 5.9
    - tmux 1.8
  - Makefiles

This renders it suitable for deployment to environments lacking
compilers and/or Internet access.

## Supported platforms

I tested this on CentOS 5 and 6.

## Build instructions

    git clone https://github.com/maniaphobic/static-tmux/
    cd static-tmux
    git checkout 1.8
    make

