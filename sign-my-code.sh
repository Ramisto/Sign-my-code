#!/usr/bin/bash

# ----------------------------------
# Functions
# ----------------------------------

banner () {
echo -e "\033[0;35m     _______. __    _______ .__   __.    .___  ___. ____    ____      ______   ______    _______   _______ \033[0m";
echo -e "\033[0;35m    /       ||  |  /  _____||  \ |  |    |   \/   | \   \  /   /     /      | /  __  \  |       \ |   ____|\033[0m";
echo -e "\033[0;35m   |   (----\|  | |  |  __|\|  |    |    \  /  |  \  \/   /   |    ,----'|  | | |  |  .--.  ||   ||__   \033[0m";
echo -e "\033[0;35m    \   \    |  | |  | |_ | | .\`   |     |  |\/|  |   \_    _/      |    |    | |  |  | | |  |  |||   __|  \033[0m";
echo -e "\033[0;35m.----)   |   |  | |  |__| | |  |\   |    |  |  |  |     |  |        |    \`--. |  \`--' | |  '--'  ||____ \033[0m";
echo -e "\033[0;35m|_______/    |__|  \______| |__| \__|    |__|  |__|     |__|         \______| \______/  |_______/ |_______|\033[0m";
echo -e "";  
}

gpg-git-install () {
    # Function for install gpg and git packages 
    echo -e '\033[0;35m--- Installing GPG ---\033[0m';
    sudo apt -y install gpg
    echo -e '\033[0;35m----------done-------------\033[0m';

    echo -e '\033[0;35m--- Installing Git ---\033[0m';
    sudo apt -y install git
    echo -e '\033[0;35m----------done-------------\033[0m';
    echo -e '';
}

#gh-install () {
    # Function for install github cli package
#    echo -e '\033[0;35m--- Installing Github CLI ---\033[0m';
#    type -p curl >/dev/null || (sudo apt update && sudo apt install curl -y)
#    curl -fsSL https://cli.github.com/packages/githubcli-archive-keyring.gpg | sudo dd of=/usr/share/keyrings/githubcli-archive-keyring.gpg \
#    && sudo chmod go+r /usr/share/keyrings/githubcli-archive-keyring.gpg \
#    && echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | sudo tee /etc/apt/sources.list.d/github-cli.list > /dev/null \
#    && sudo apt update \
#    && sudo apt install gh -y
#    echo -e '\033[0;35m----------done-------------\033[0m';
#}

check-GPG-key () {
    # Function for check for existing GPG keys
    # This command to list the long form of the GPG keys
    echo -e '\033[0;35m--- Check for existing GPG keys ---\033[0m';
    gpg --list-secret-keys --keyid-format=long
    echo -e '\033[0;35m----------done-------------\033[0m';
    echo -e '';
}

generate-new-GPG-key () {
    # Function for generate a new GPG key
    echo -e '\033[0;35m--- Check for existing GPG keys ---\033[0m';
    echo -e '\033[0;35m1) for specify the kind of key you want, press Enter to accept the default.\033[0m';
    echo -e '\033[0;35m2) for specify the key size you want, press Enter to accept the default.\033[0m';
    echo -e '\033[0;35m3) for specify the length of time the key should be valid, indicate '90' and press Enter to accept (90 days).\033[0m';
    echo -e '\033[0;35m4) enter your realname (John Doe)\033[0m';
    echo -e '\033[0;35m5) enter your professional e-mail address (john.doe@business.com)\033[0m';
    echo -e '\033[0;35m5) enter your passphrase (ideally with dashlane, 1password, etc...)\033[0m';
    gpg --full-generate-key
    echo -e '\033[0;35m----------done-------------\033[0m';
    echo -e '';
    
    check-GPG-key
}

add-gpg-key-github () {
    check-GPG-key

    echo -e '\033[0;35m--- Export GPG key ---\033[0m';
    read -p 'Enter your GPG key id above (examples : 3AA5C34371567BD2): ' idKey
    gpg --armor --export $idKey
    echo -e ''

    echo -e '\033[0;35mCopy this export to your github account (beginning with -----BEGIN PGP PUBLIC KEY BLOCK----- and ending with -----END PGP PUBLIC KEY BLOCK-----)\033[0m';
    echo -e '\033[0;35mAnd paste to your gitub account here : https://github.com/settings/keys (click to "New GPG key")\033[0m';
    echo -e '\033[0;35m----------done-------------\033[0m';
    echo -e '';
}

configure-git-cli () {
    echo -e '\033[0;35m--- Telling Git about your signing key ---\033[0m';
    echo -e '';
    git config --global --unset gpg.format

    check-GPG-key

    read -p 'Enter your GPG key id above (examples 3AA5C34371567BD2): ' idKey
    echo -e '';

    echo -e '\Primary key definition and configure Git to sign all commits by default...';
    git config --global user.signingkey $idKey
    git config --global commit.gpgsign true
    echo -e '';

    echo -e 'Add your GPG key to your .bashrc startup file...';
    [ -f ~/.bashrc ] && echo -e '\nexport GPG_TTY=$(tty)' >> ~/.bashrc
    echo -e '\033[0;35m----------done-------------\033[0m';
    echo -e '';
}

sign-commit-examples () {
    echo -e '\033[0;35m--- Sign commits examples ---\033[0m';
    echo -e '';
    echo -e '$ git commit -S -m "YOUR_COMMIT_MESSAGE"';
    echo -e '';
    echo -e 'And enter your passphrase';
    echo -e '';
    echo -e '\033[0;35m----------done-------------\033[0m';
}


# ----------------------------------
# Select menu
# ----------------------------------

banner

PS3='Please enter your choice: '
options=("Install gpg, git and github cli packages" "Check for existing GPG keys" "Generate a new GPG key" "Add a GPG key to your GitHub account" "Tell Git about your signing key" "Sign commits examples" "Quit")

select opt in "${options[@]}";
do
    case $opt in
        "Install gpg, git and github cli packages")
            gpg-git-install
            gh-install
            ;;
        "Check for existing GPG keys")
            check-GPG-key
            ;;
        "Generate a new GPG key")
            generate-new-GPG-key
            ;;
        "Add a GPG key to your GitHub account")
            add-gpg-key-github
            ;;
        "Tell Git about your signing key")
            configure-git-cli
            ;;
        "Sign commits examples")
            sign-commit-examples
            ;;
        "Quit")
            break
            ;;
        *) 
            echo "Invalid option $REPLY"
            ;;
    esac
done