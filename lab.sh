#!/bin/bash
# ssh key config
mkdir /home/vinicius/.ssh/
cp authorized_keys /home/vinicius/.ssh/
cp authorized_keys /root/.ssh/
# custom vi
cp .vimrc /home/vinicius/
cp .vimrc /root/
# ssh config
sed -i 's/#PermitRootLogin/PermitRootLogin/' /etc/ssh/sshd_config
sed -i 's/#PubkeyAuthentication/PubkeyAuthentication/' /etc/ssh/sshd_config
systemctl reload sshd
systemctl restart sshd
# update
apt-get -y update
# net tools
apt-get -y install net-tools
# sudoers
touch /etc/sudoers.d/90-sudo
echo "vinicius ALL=(ALL) NOPASSWD:ALL" > /etc/sudoers.d/90-sudo
# rc.local
cp start.sh /home/vinicius/
chmod +x /home/vinicius/start.sh
cp rc.local /etc/
chown root /etc/rc.local
chmod 755 /etc/rc.local
sleep 15
apt-get -y update && apt-get -y upgrade
