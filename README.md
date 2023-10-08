<p align="center" width="100%"><img width="50%" src="./img/banner.png"></p>
<p align="center">A bash script for sign your commits</p>

<p align="center">
  <a href="#introduction">Introduction</a>
 • <a href="#requirements">Requirements</a>
 • <a href="#usage">Usages</a>
 • <a href="#examples">Examples</a>
  • <a href="#todo">TODO</a>
</p>

# Introduction

This bash script lets you create your GPG key, and configure your git client to sign all your commits.

Signing your commits allows your organization to clearly identify you, and thus mitigates the risk of manipulating unauthorized source code.

This script also makes it easier to validate the chapter the "Signing of code" security measure of the OWASP DSOMM model here : 

- [OWASP DSOMM Signing of Code](https://dsomm.owasp.org/activity-description?dimension=Build%20and%20Deployment&subDimension=Build&level=3&activityName=Signing%20of%20code )

Official documentation : 

- [About commit signature verification](https://docs.github.com/en/authentication/managing-commit-signature-verification/about-commit-signature-verification)

# Requirements

- gpg
- git
- Ubuntu or Debian OS

# Usages

### Scenario 1 : You want to sign your commits from scratch

Follow these steps in order :

1) Install gpg, git and github cli packages
2) Generate a new GPG key
3) Add a GPG key to your GitHub account
4) Tell Git about your signing key
5) Sign commits examples
6) Quit

### Scenario 2 : You want to sign your commits with an existing GPG key, and GPG/Git packages is already installed

Follow these steps in order :

1) Add a GPG key to your GitHub account
2) Tell Git about your signing key
3) Sign commits examples
4) Quit

Other scenarios are possible, just select the script function that will help you ;-)

# Examples

Test performed in an Ubuntu 22.04.3 LTS virtual machine with no special configurations (starting from scratch).

# TODO

- Use github cli in the "Add a GPG key to your GitHub account" function to make the process even easier.