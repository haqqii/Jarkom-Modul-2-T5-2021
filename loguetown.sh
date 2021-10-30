echo "nameserver 192.168.122.1" > /etc/resolv.conf
apt-get update
apt-get install dnsutils -y
apt-get install lynx -y
# nomor 5
echo "
nameserver 10.44.2.2
nameserver 10.44.2.3
nameserver 10.44.2.4
" > /etc/resolv.conf
