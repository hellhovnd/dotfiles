#!/bin/sh
umask go-rwx

# if running bash
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
    . "$HOME/.bashrc"
    fi
fi

# set PATH to include user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:${PATH}"
fi

export PATH=/opt/local/bin:/opt/local/sbin:$PATH

