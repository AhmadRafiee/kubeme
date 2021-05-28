#!/bin/bash
# Variable Section -------------------------------------------
docker_version=19.03.5
DOCKER_DEST=/etc/systemd/system/docker.service.d/
MIRROR_REGISTRY=https://docker.jamko.ir
#-------------------------------------------------------------

echo "change DNS server to shecan "
cat /etc/resolv.conf
echo "nameserver 178.22.122.100" > /etc/resolv.conf
echo "nameserver 185.51.200.2" >> /etc/resolv.conf 
cat /etc/resolv.conf
sleep 3

echo -e "Docker Installation" 
which docker || { curl -fsSL https://releases.rancher.com/install-docker/${docker_version}.sh | bash; }
{
systemctl enable docker
systemctl restart docker
systemctl is-active --quiet docker && echo -e "\e[1m \e[96m docker service: \e[30;48;5;82m \e[5mRunning \e[0m" || echo -e "\e[1m \e[96m docker service: \e[30;48;5;196m \e[5mNot Running \e[0m"
}

echo "Configur docker daemon "
if [ -d $DOCKER_DEST ] ; then
   echo "file exist"
else
   mkdir -p /etc/systemd/system/docker.service.d/
   touch /etc/systemd/system/docker.service.d/override.conf
fi   

cat <<EOT > /etc/systemd/system/docker.service.d/override.conf
[Service]
ExecStart=
ExecStart=/usr/bin/dockerd --registry-mirror $MIRROR_REGISTRY --log-opt max-size=500m --log-opt max-file=5
EOT
cat /etc/systemd/system/docker.service.d/override.conf
{
systemctl daemon-reload
systemctl restart docker
systemctl is-active --quiet docker && echo -e "\e[1m \e[96m docker service: \e[30;48;5;82m \e[5mRunning \e[0m" || echo -e "\e[1m \e[96m docker service: \e[30;48;5;196m \e[5mNot Running \e[0m"
}

echo "docker-compose Installation" 
which docker-compose || { sudo curl -L "https://github.com/docker/compose/releases/download/1.27.4/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose; chmod +x /usr/local/bin/docker-compose; }

{
docker-compose --version
}

echo "change DNS server"

cat /etc/resolv.conf
echo "nameserver 8.8.8.8" > /etc/resolv.conf
echo "nameserver 9.9.9.9" >> /etc/resolv.conf 
cat /etc/resolv.conf

echo "how to fix WARNING: No swap limit support"
cat /etc/default/grub
echo "GRUB_CMDLINE_LINUX=cgroup_enable=memory swapaccount=1" >> /etc/default/grub
cat /etc/default/grub
sudo update-grub

echo "Remove all unused packages"
apt autoremove -y