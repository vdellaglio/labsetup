#!/bin/bash
cd /home/vinicius/labsetup
# ssh key config
mkdir /home/vinicius/.ssh/
cp /home/vinicius/labsetup/authorized_keys /home/vinicius/.ssh/
cp /home/vinicius/labsetup/authorized_keys /root/.ssh/
# custom vi
cp /home/vinicius/labsetup/.vimrc /home/vinicius/
cp /home/vinicius/labsetup/.vimrc /root/
# ssh config
sed -i 's/#PermitRootLogin/PermitRootLogin/' /etc/ssh/sshd_config
sed -i 's/#PubkeyAuthentication/PubkeyAuthentication/' /etc/ssh/sshd_config
# update
apt-get -y update
# net tools
apt-get -y install net-tools
# update and upgrade
apt-get -y update && apt-get -y upgrade
# sudoers
touch /etc/sudoers.d/90-sudo
echo "vinicius ALL=(ALL) NOPASSWD:ALL" > /etc/sudoers.d/90-sudo
# custom vi
cp .vimrc /home/vinicius/
cp .vimrc /root/
# rc.local
cp start.sh /home/vinicius/
chmod +x /home/vinicius/start.sh
cp rc.local /etc/
chown root /etc/rc.local
chmod 755 /etc/rc.local
