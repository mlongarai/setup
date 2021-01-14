#!/bin/bash

# Customizations - SSH Config & SSH Keys

sudo cat > ~/.ssh/config << '_EOF'
Host github.com
  User git
  HostName github.com
  UseKeychain yes
  AddKeysToAgent yes
  IdentityFile ~/.ssh/github

Host *
  UseKeychain yes
  AddKeysToAgent yes
  IdentityFile ~/.ssh/work_sb

_EOF

ssh-keygen -t rsa -b 4096 -N '' -C "yourmail@mail.com" -f ~/.ssh/personal
ssh-keygen -t rsa -b 4096 -N '' -C "yourmail@mail.com" -f ~/.ssh/work_sb
ssh-keygen -t rsa -b 4096 -N '' -C "yourmail@mail.com" -f ~/.ssh/github

eval "$(ssh-agent -s)"
ssh-add ~/.ssh/personal
ssh-add ~/.ssh/work_sb
ssh-add ~/.ssh/github

chmod 700 ~/.ssh
chmod 600 ~/.ssh/*
chmod 644 ~/.ssh/*.pub
chmod 644 ~/.ssh/authorized_keys
chmod 644 ~/.ssh/known_hosts
chmod 644 ~/.ssh/config
