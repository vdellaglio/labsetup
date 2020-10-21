#!/bin/bash
# ssh key config
mkdir /home/vinicius/.ssh/
cp authorized_keys /home/vinicius/.ssh/
cp authorized_keys /root/.ssh/
# custom vi
cp .vimrc /home/vinicius/
cp .vimrc /root/
# ssh config
sed -i 's/#PermitRootLogin/PermitRootLogin/' /etc/ssh/sshd_config
sed -i 's/#PubkeyAuthentication/PubkeyAuthentication/' /etc/ssh/sshd_config
