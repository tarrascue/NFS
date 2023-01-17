sudo -i
yum install nfs-utils -y
systemctl enable firewalld --now
firewall-cmd --add-service="nfs3" --permanent
firewall-cmd --add-service="rpc-bind" --permanent
firewall-cmd --add-service="mountd" --permanent
firewall-cmd --reload
systemctl enable nfs --now
mkdir -p /srv/share/upload
chown -R nfsnobody:nfsnobody /srv/share
chmod 0777 /srv/share/upload
echo "/srv/share 192.168.50.11/32(rw,sync,root_squash)" >> /etc/exports
exportfs -r
exportfs -s
cd /srv/share/upload
touch check_file
