#!/usr/bin/sh

 install-gpg () {
    if [ $(dpkg-query -W -f='${Status}' gpg 2>/dev/null | grep -c "ok gpg installed") -eq 0 ];
    then
        echo -e '\031[A;B;Cm gpg not installed \033[0m'
        apt install gpg;
    fi
}


install-gpg