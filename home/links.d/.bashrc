#!/bin/bash
# If not running interactively, don't do anything
if [[ $- == *i* ]]; then
    if [[ ! "${TERM}" = "dumb" ]]; then
        source "${HOME}/.bashrc.local"
    fi
else
    return
fi
