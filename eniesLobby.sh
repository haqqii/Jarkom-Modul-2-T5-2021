echo "nameserver 192.168.122.1" > /etc/resolv.conf
apt-get update
apt-get install bind9 -y
echo 'zone "franky.t07.com" {
type master;
file "/etc/bind/kaizoku/franky.t07.com";
};'
# nomor 2
echo 'zone "franky.t07.com" {
        type master;
        file "/etc/bind/kaizoku/franky.t07.com";
};' > /etc/bind/named.conf.local
mkdir /etc/bind/kaizoku
echo "
\$TTL    604800
@       IN      SOA     franky.t07.com. root.franky.t07.com. (
                        2021100401      ; Serial
                        604800          ; Refresh
                        86400           ; Retry
                        2419200         ; Expire
                        604800 )        ; Negative Cache TTL
;
@               IN      NS      franky.t07.com.
@               IN      A       10.45.2.2 ; IP EniesLobby
www             IN      CNAME   franky.t07.com.
" > /etc/bind/kaizoku/franky.t07.com
service bind9 restart

# nomor 3
echo "
\$TTL    604800
@       IN      SOA     franky.t07.com. root.franky.t07.com. (
                        2021100401      ; Serial
                        604800          ; Refresh
                        86400           ; Retry
                        2419200         ; Expire
                        604800 )        ; Negative Cache TTL
;
@               IN      NS      franky.t07.com.
@               IN      A       10.45.2.2 ; IP EniesLobby
www             IN      CNAME   franky.t07.com.
super           IN      A       10.45.2.4 ; IP skype
www.super       IN      CNAME   super.franky.t07.com.
" > /etc/bind/kaizoku/franky.t07.com
service bind9 restart

# nomor 4

echo '
zone "franky.t07.com" {
        type master;
        file "/etc/bind/kaizoku/franky.t07.com";
};
zone "2.45.10.in-addr.arpa" {
        type master;
        file "/etc/bind/kaizoku/2.45.10.in-addr.arpa";
};' > /etc/bind/named.conf.local

echo "
\$TTL    604800
@       IN      SOA     franky.t07.com. root.franky.t07.com. (
                        2021100401      ; Serial
                        604800          ; Refresh
                        86400         ; Retry
                        2419200         ; Expire
                        604800 )       ; Negative Cache TTL
;
2.45.10.in-addr.arpa.   IN      NS      franky.t07.com.
2                       IN      PTR     franky.t07.com.
"> /etc/bind/kaizoku/2.45.10.in-addr.arpa
service bind9 restart


# nomor 5

echo '
zone "franky.t07.com" {
        type master;
        notify yes;
        also-notify {10.45.2.3;};  //Masukan IP Water7 tanpa tanda petik
        allow-transfer {10.45.2.3;}; // Masukan IP Water7 tanpa tanda petik
        file "/etc/bind/kaizoku/franky.t07.com";
};
zone "2.45.10.in-addr.arpa" {
        type master;
        file "/etc/bind/kaizoku/2.45.10.in-addr.arpa";
};' > /etc/bind/named.conf.local
service bind9 restart

# nomor 6
echo "
\$TTL    604800
@       IN      SOA     franky.t07.com. root.franky.t07.com. (
                        2021100401      ; Serial
                        604800          ; Refresh
                        86400           ; Retry
                        2419200         ; Expire
                        604800 )        ; Negative Cache TTL
;
@               IN      NS      franky.t07.com.
@               IN      A       10.45.2.4 ; IP skypea
www             IN      CNAME   franky.t07.com.
super           IN      A       10.45.2.4 ; IP skypea
www.super       IN      CNAME   super.franky.t07.com.
ns1             IN      A       10.45.2.3; IP Water7
mecha           IN      NS      ns1
"> /etc/bind/kaizoku/franky.t07.com

echo "
options {
        directory \"/var/cache/bind\";
        allow-query{any;};
        auth-nxdomain no;    # conform to RFC1035
        listen-on-v6 { any; };
};
" > /etc/bind/named.conf.options

echo '
zone "franky.t07.com" {
        type master;
        //notify yes;
        //also-notify {10.45.2.3;};  Masukan IP Water7 tanpa tanda petik
        file "/etc/bind/kaizoku/franky.t07.com";
        allow-transfer {10.45.2.3;}; // Masukan IP Water7 tanpa tanda petik
};
zone "2.45.10.in-addr.arpa" {
        type master;
        file "/etc/bind/kaizoku/2.45.10.in-addr.arpa";
};
' >  /etc/bind/named.conf.local

service bind9 restart
