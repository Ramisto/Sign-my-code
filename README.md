<p align="center" width="100%"><img width="50%" src="./img/banner.png"></p>
<p align="center">A bash script for sign your commits</p>

<p align="center">
  <a href="#introduction">Introduction</a>
 • <a href="#requirements">Requirements</a>
 • <a href="#usage">Usage</a>
 • <a href="#examples">Examples</a>
  • <a href="#todo">TODO</a>
</p>

# Introduction

This simple bash script has been designed to help you configure your environment to sign your commits with a GPG key.

Official documentation : 

- [About commit signature verification](https://docs.github.com/en/authentication/managing-commit-signature-verification/about-commit-signature-verification)

# Requirements

- Ubuntu or Debian OS
- gpg
- git
- root privilege


# Usage

```
$ su
$ chmod +x sign-my-code.sh
$ ./sign-my-code.sh

or

$ sudo chmod +x sign-my-code.sh
$ sudo ./sign-my-code.sh

```

### Scenario 1 : You want to sign your commits from scratch

Follow these steps in order :

- Execute this script with root privilege
- Install gpg & git packages
- Generate a new GPG key
- Add a GPG key to your GitHub account
- Tell Git about your signing key
- Sign commits examples
- Quit

### Scenario 2 : You want to sign your commits with an existing GPG key, and GPG/Git packages is already installed

Follow these steps in order :

- Add a GPG key to your GitHub account
- Tell Git about your signing key
- Sign commits examples
- Quit

Other scenarios are possible, just select the option that will help you ;-)

# Examples

Test performed in an Xubuntu 22.04.3 LTS virtualbox machine with root privilege.

![ubuntu-lab](img/ubuntu-lab.png)

Execute this script : 

![chmod](img/chmod.png)

Install gpg & git packages : 

![install-git-gpg](img/install-git-gpg.png)

