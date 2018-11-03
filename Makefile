#!/usr/bin/make -f

install:
	install -m 644 tmux.conf ~/.tmux.conf
	install -m 644 vimrc ~/.vimrc

