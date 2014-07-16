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

## Caveats

  - These instructions assume gcc and g++ are installed in your build
    environment.
  - Compiling ncurses currently fails with this error:

> config.status: error: cannot find input file: NCURSES_MAJOR
> make[1]: *** [/home/kenneth.maupin/tmp/static-tmux/build/ncurses-5.9/Makefile] Error 1
> make[1]: Leaving directory `/home/kenneth.maupin/tmp/static-tmux'
> make: *** [ncurses] Error 2
