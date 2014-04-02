# zsh

## Startup Files

| File | Interactive - Login | Interactive Non-Login | Script |
| ------------- | :---: | :---: | :---: |
| /etc/zshenv   |  1st  |  1st  |  1st  |
| ~/.zshenv     |  2nd  |  2nd  |  2nd  |
| /etc/profile  |  3rd  |       |      |
| ~/.zprofile   |  4th  |       |      |
| /etc/zshrc    |  5th  |  3rd  |      |
| ~/.zshrc      |  6th  |  4th  |      |
| /etc/zlogin   |  7th  |       |      |
| ~/.zlogin     |  8th  |       |      |

## Shutdown Files

| File | Interactive - Login | Interactive Non-Login | Script |
| ------------- | :---: | :---: | :---: |
| ~/.zlogout    |  1st  |       |       |
| /etc/zlogout  |  2nd  |       |       |


# bash

## Startup Files

| File | Interactive - Login | Interactive Non-Login | Script |
| ----------------- | :-----: | :---: | :---: |
| /etc/profile      |   1st   |       |       |
| /etc/bash.bashrc  |         |  1st  |       |
| ~/.bashrc         |         |  2nd  |       |
| ~/.bash_profile   |  2nd-A  |       |       |
| ~/.bash_login     |  2nd-B  |       |       |
| ~/.profile        |  2nd-C  |       |       |
| BASH_ENV          |         |       |  1st  |

## Shutdown Files


| File | Interactive - Login | Interactive Non-Login | Script |
| ----------------- | :-----: | :---: | :---: |
| ~/.bash_logut     |   1st   |       |       |