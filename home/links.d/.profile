#!/bin/bash
# Sample .profile for SuSE Linux
# rewritten by Christian Steinruecken <cstein@suse.de>
#
# This file is read each time a login shell is started.
# All other interactive shells will only read .bashrc; this is particularly
#
# important for language settings, see below.
test -z "$PROFILEREAD" && . /etc/profile || true

if [[ -z "$LOCAL_PROFILEREAD" ]]; then
    export PAGER="less"
    export LESS="-FgiKmQsSX";
    export MYSQL_LESS="-FesSQX";
    export EDITOR="/bin/vim";
    export VISUAL="/bin/gvim";
    if [[ -e "${HOME}/.common.home" ]]; then export COMMON_HOME="${HOME}/.common.home"; fi
    if [[ -z "$MAN_POSIXLY_CORRECT" ]]; then export MAN_POSIXLY_CORRECT=1; fi
    if [[ -e "${HOME}/bin" ]]; then
        case ":$PATH:" in
            *":${HOME}/bin:"* ) : ;; # home/$username/bin is already in the path
            *) PATH="$PATH:${HOME}/bin" ;;
        esac
    fi
    if [[ -e "/usr/local/pgsql/bin" ]]; then
        case ":$PATH:" in
            *":/usr/local/pgsql/bin:"* ) : ;; # local pgsql bin is already in the path
            *) PATH="$PATH:/usr/local/pgsql/bin" ;;
        esac
    fi
    if [[ -e "${HOME}/.profile.d/" ]]; then
        profile_dir=$(readlink -f ${HOME}/.profile.d)
        for s in $profile_dir/*.sh; do
            . "$s"
        done
        unset s
    fi
    if [[ -e "/usr/local/src/depot_tools" ]]; then
        case ":$PATH:" in
            *":$/usr/local/src/depot_tools:"*) : ;; # already in path
            *) PATH="$PATH:/usr/local/src/depot_tools" ;;
        esac
    fi
    BOARD="x86-generic"
    LOCAL_PROFILEREAD=true
    export PATH BOARD LOCAL_PROFILEREAD
fi
