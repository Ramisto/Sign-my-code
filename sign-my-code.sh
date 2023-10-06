#!/usr/bin/bash

# ----------------------------------
# Colors
# ----------------------------------
NOCOLOR='\033[0m'
RED='\033[0;31m'
GREEN='\033[0;32m'
ORANGE='\033[0;33m'
BLUE='\033[0;34m'
PURPLE='\033[0;35m'
CYAN='\033[0;36m'
LIGHTGRAY='\033[0;37m'
DARKGRAY='\033[1;30m'
LIGHTRED='\033[1;31m'
LIGHTGREEN='\033[1;32m'
YELLOW='\033[1;33m'
LIGHTBLUE='\033[1;34m'
LIGHTPURPLE='\033[1;35m'
LIGHTCYAN='\033[1;36m'
WHITE='\033[1;37m'


# ----------------------------------
# Functions
# ----------------------------------
gpg-install () {
    # Verify if gpg is already installed, if not, install the package
    pkg=gpg
    status="$(dpkg-query -W --showformat='${db:Status-Status}' "$pkg" 2>&1)"
    NOCOLOR='\033[0m'
    RED='\033[0;31m'

    if [ ! $? = 0 ] || [ ! "$status" = installed ]; then
    echo -e '\033[0;31m### Installing GPG... ###\033[0m'
    sudo apt -y install $pkg
    fi
}

git-install () {
    # Verify if git is already installed, if not, install the package
    pkg=git
    status="$(dpkg-query -W --showformat='${db:Status-Status}' "$pkg" 2>&1)"

    if [ ! $? = 0 ] || [ ! "$status" = installed ]; then
    echo -e '\033[0;31m### Installing GIT... ###\033[0m'
    sudo apt -y install $pkg
    fi
}

check-keys () {
    # Checking for existing GPG keys
    # This command to list the long form of the GPG keys
    echo -e '\033[0;31m### Checking for existing GPG keys... ###\033[0m'
    gpg --list-secret-keys --keyid-format=long
    echo -e '\033[0;31m########\033[0m'
}

new-key-and-configure-git () {
    echo -e '\033[0;31m### Generate a new GPG keys... ###\033[0m'
    read -r -p 'Would you like to generate a new GPG key to sign your commits? [y/N]' response
    if [[ "$response" =~ ^([yY][eE][sS]|[yY])$ ]]
    then
        gpg --full-generate-key
        echo -e '\033[0;31m########\033[0m'

        echo -e '\033[0;31m### Configuring your Git CLI in progress... ###\033[0m'
        git config --global --unset gpg.format
        gpg --list-secret-keys --keyid-format=long

    else
        echo -e '\033[0;34m Okay, if you already have a key, then go next step (declare your key in your Github account <3)\033[0m'
        echo -e 'click here : https://docs.github.com/en/authentication/managing-commit-signature-verification/adding-a-gpg-key-to-your-github-account'
    fi
}


# ----------------------------------
# Main
# ----------------------------------

# Install pre-requisites packages
gpg-install
git-install

# Checking for existing GPG keys
check-keys

# Generate a new GPG key
generate-new-key