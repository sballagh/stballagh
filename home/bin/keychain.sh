#!/bin/bash
# =========================================================================================
# Use kaskpass if it is installed
# =========================================================================================
if [[ -n "$KEYCHAINED" ]]
then
    exit 6
fi
SSH_ASKPASS="/usr/lib/ssh/ssh_askpass"
kaskpass="/usr/lib/ssh/ksshaskpass"
if [[ -n $DISPLAY && -e "${kaskpass}" ]]
then
    SSH_ASKPASS="${kaskpass}"
fi
export SSH_ASKPASS
# check to see if keychain exists
# verify that id_rsa exists
id_rsa="${HOME}/.ssh/id_rsa"
if [[ ! -e "${id_rsa}" ]];
then
    printf "${Red}The ${Magenta}RSA Private Key${Red} file (${Magenta}%s${Red}) was not found!${Normal}\n" "${id_rsa}"
fi
printf "${Blue}Using ${Cyan}%-12s: ${Green}%s${Normal}\n" "SSH_ASKPASS" "${SSH_ASKPASS}"
keychain=$(which keychain)
if [[ -n $keychain ]];  # redirecting both stdout and stderr to /dev/null
then
    printf "${Blue}Using ${Green}%s${Normal}." "$keychain"
    eval `$keychain --inherit any --eval id_rsa`
else
    printf "${Blue}Using ${Green}%s${Normal}." "$(which ssh-agent)"
    eval `ssh-agent -s`
    ssh-add "${id_rsa}"
fi
