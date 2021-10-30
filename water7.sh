echo "nameserver 192.168.122.1" > /etc/resolv.conf
apt-get update

# nomor 5
apt-get update
apt-get install bind9 -y
echo '
zone "franky.t05.com" {
        type slave;
        masters { 10.44.2.2; }; // Masukan IP EniesLobby tanpa tanda petik
        file "/var/lib/bind/franky.t05.com";
};
' > /etc/bind/named.conf.local
service bind9 restart

# nomor 6

echo "
options {
        directory \"/var/cache/bind\";
        allow-query{any;};
        auth-nxdomain no;    # conform to RFC1035
        listen-on-v6 { any; };
};
" > /etc/bind/named.conf.options
echo '
zone "franky.t05.com" {
        type slave;
        masters { 10.44.2.2; }; // Masukan IP EniesLobby tanpa tanda petik
        file "/var/lib/bind/franky.t05.com";
};
zone "mecha.franky.t05.com"{
        type master;
        file "/etc/bind/sunnygo/mecha.franky.t05.com";
};
'> /etc/bind/named.conf.local
mkdir /etc/bind/sunnygo
echo "
\$TTL    604800
@       IN      SOA     mecha.franky.t05.com. root.mecha.franky.t05.com. (
                        2021100401      ; Serial
                        604800         ; Refresh
                        86400         ; Retry
                        2419200         ; Expire
                        604800 )       ; Negative Cache TTL
;
@               IN      NS      mecha.franky.t05.com.
@               IN      A       10.44.2.4       ;ip skypie
www             IN      CNAME   mecha.franky.t05.com.
" > /etc/bind/sunnygo/mecha.franky.t05.com
service bind9 restart


# Nomor 7
echo "
\$TTL    604800
@       IN      SOA     mecha.franky.t05.com. root.mecha.franky.t07.com. (
                        2021100401      ; Serial
                        604800         ; Refresh
                        86400         ; Retry
                        2419200         ; Expire
                        604800 )       ; Negative Cache TTL
;
@               IN      NS      mecha.franky.t05.com.
@               IN      A       10.44.2.4       ;ip skypie
www             IN      CNAME   mecha.franky.t05.com.
general         IN      A       10.44.2.4       ;IP skypie
www.general     IN      CNAME   general.mecha.franky.t05.com.
" > /etc/bind/sunnygo/mecha.franky.t05.com
service bind9 restart
