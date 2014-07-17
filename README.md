# Compiling tmux as a static binary

## Overview

This repo contains everything one needs to compile tmux as a
self-contained static binary, namely:

  - Source code for tmux 1.9a and its dependencies:
    - libevent 2.0.21
    - ncurses 5.9
  - Makefiles

This renders it suitable for deployment to environments lacking
compilers and/or Internet access.

## Supported platforms

I tested this on CentOS 5 and 6.

## Prerequisites

CentOS:

    sudo yum install -y \
      gcc \
      gcc-c++ \
      glibc-static \
	  ;

## Build instructions

    git clone https://github.com/maniaphobic/static-tmux/
    cd static-tmux
    git checkout 1.9a
    make

## Caveats

  - On CentOS 5.9, compiling ncurses currently fails with this error:

> config.status: error: cannot find input file: NCURSES_MAJOR
> make[1]: *** [/home/kenneth.maupin/tmp/static-tmux/build/ncurses-5.9/Makefile] Error 1
> make[1]: Leaving directory `/home/kenneth.maupin/tmp/static-tmux'
> make: *** [ncurses] Error 2
