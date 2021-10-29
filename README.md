# Jarkom-Modul-2-T5-2021
Oleh :
1. Shavica Ihya Q A L    (05311940000013)
2. Gerry Putra Fresnando (05311940000031)
3. Mohammad Ibadul Haqqi (05311940000037)

---

## Pembukaan Soal
Luffy adalah seorang yang akan jadi Raja Bajak Laut. Demi membuat Luffy menjadi Raja Bajak Laut, Nami ingin membuat sebuah peta, bantu Nami untuk membuat peta berikut:

![image](https://user-images.githubusercontent.com/61973814/139194256-c0640fcf-d5ad-448f-a38d-905adf9a82dd.png)

EniesLobby akan dijadikan sebagai DNS Master, Water7 akan dijadikan DNS Slave, dan Skypie akan digunakan sebagai Web Server. Terdapat 2 Client yaitu Loguetown, dan Alabasta. Semua node terhubung pada router Foosha, sehingga dapat mengakses internet

## Jawaban
### Soal 1
EniesLobby akan dijadikan sebagai DNS Master, Water7 akan dijadikan DNS Slave, dan Skypie akan digunakan sebagai Web Server. Terdapat 2 Client yaitu Loguetown, dan Alabasta. Semua node terhubung pada router Foosha, sehingga dapat mengakses internet

### Jawaban Soal 1
- ***Foosha sebagai Router***
![messageImage_1635412808074](https://user-images.githubusercontent.com/61973814/139356832-7a2e69ea-6efd-459d-82f0-f579611f01c9.jpg)

- ***Loguetown sebagai Client***

```
apt-get update         
apt-get install dnsutils  
```
![Loguetown](https://user-images.githubusercontent.com/61973814/139357187-449c778e-2935-4fa4-8d0f-5c8cc1cf5a99.jpg)


- ***Alabasta sebagai Client***

![alabasta](https://user-images.githubusercontent.com/61973814/139357401-50f327b7-9ae4-4206-9985-f1b4bcf54e91.jpg)

- ***Water7 sebagai DNS Slave***

```
apt-get update  
apt-get install bind9 -y       
echo "nameserver 192.168.122.1" > /etc/resolv.conf       
```

![water7](https://user-images.githubusercontent.com/61973814/139358785-ccda90a7-12c6-4085-9691-30aa713e9b77.jpg)

- ***EniesLobby sebagai DNS Master***

```
apt-get update  
apt-get install bind9 -y  
```

![Enies](https://user-images.githubusercontent.com/61973814/139359121-edcfaccf-03f8-428d-a81a-76124a258e84.jpg)


- ***Skypie sebagai webserver***

![skypie](https://user-images.githubusercontent.com/61973814/139358532-b514ad4e-cc44-4d42-8837-7808a9b46124.jpg)

- Kemudian setiap node diaktifkan dengan mengklik tombol start. Setelah itu, menjalankan command `iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE -s 10.44.0.0/16` pada router Foosha upaya dapat terkoneksi dengan internet.


### Soal 2
Luffy ingin menghubungi Franky yang berada di EniesLobby dengan denden mushi. Kalian diminta Luffy untuk membuat website utama dengan mengakses `franky.yyy.com` dengan alias `www.franky.yyy.com` pada folder `kaizoku`

### Jawaban Soal 2
***Server EniesLobby***

Melakukan Konfigurasi terhadap file `/etc/bind/named.conf.local` dan menambahkan

```
zone "franky.t05.com" {  
        type master;  
        file "/etc/bind/kaizoku/franky.t05.com";
};
```

- Lalu buat direktory baru bernama `kaizoku`
- Copykan file db.local pada path `/etc/bind` ke dalam folder `kaizoku` yang baru saja dibuat dan ubah namanya menjadi `franky.t05.com`

```
cp /etc/bind/db.local /etc/bind/kaizoku/franky.t05.com
```

- Lalu tambahkan konfigurasi pada file `/etc/bind/kaizoku/franky.t05.com`

```
$TTL    604800  
@       IN      SOA     franky.t05.com. root.franky.t05.com. (
                        2021100401      ; Serial
                        604800          ; Refresh
                        86400           ; Retry
                        2419200         ; Expire
                        604800 )        ; Negative Cache TTL
;
@               IN      NS      franky.t05.com.
@               IN      A       10.44.2.2 ; IP EniesLobby
www             IN      CNAME   franky.t05.com.
```

Lalu, lakukan restart `service bind9` dengan `service bind9 restart`

***TESTING***

***Server Loguetown***

```
apt-get update  
apt-get install dnsutils -y  
echo "nameserver 10.44.2.2" > /etc/resolv.conf  
```
- ping `franky.t05.com`

![messageImage_1635413549066](https://user-images.githubusercontent.com/61973814/139358214-17ecf9fc-7b14-4d8f-b140-9e46cf19657c.jpg)

- ping `www.franky.t05.com`

![messageImage_1635413640681](https://user-images.githubusercontent.com/61973814/139358352-47a05f80-4817-4eac-a2fd-6816c92a6107.jpg)

- cek CNAME dengan cara `host -t CNAME www.franky.t05.com`

![messageImage_1635413957335](https://user-images.githubusercontent.com/61973814/139359349-80d1802d-b7bb-42df-99cc-aafc4c776a11.jpg)


### Soal 3
Setelah itu buat subdomain `super.franky.yyy.com` dengan alias `www.super.franky.yyy.com` yang diatur DNS nya di EniesLobby dan mengarah ke `Skypie`

### Jawaban Soal 3
***Server EniesLobby***

Melakukan Edit pada `file /etc/bind/kaizoku/franky.t05.com` menjadi seperti berikut:

```
$TTL    604800  
@       IN      SOA     franky.t05.com. root.franky.t05.com. (  
                        2021100401      ; Serial
                        604800          ; Refresh
                        86400           ; Retry
                        2419200         ; Expire
                        604800 )        ; Negative Cache TTL
;
@               IN      NS      franky.t05.com.
@               IN      A       10.44.2.2 ; IP EniesLobby
www             IN      CNAME   franky.t05.com.
super           IN      A       10.44.2.4 ; IP skype
www.super       IN      CNAME   franky.t05.com.
```

- Melakukan `restart sevice bind9` dengan cara `service bind9 restart`

***TESTING***

ping `super.franky.t05.com`

![messageImage_1635414044539](https://user-images.githubusercontent.com/61973814/139360441-542cc05d-d1bc-4d4b-8b1c-ce9c682ff444.jpg)

ping `www.super.franky.t05.com`

![messageImage_1635414085765](https://user-images.githubusercontent.com/61973814/139360506-4ca40035-93ca-407c-a2b8-723135244998.jpg)

cek CNAME dengan cara `host -t CNAME www.super.franky.t05.com`

![messageImage_1635414116067](https://user-images.githubusercontent.com/61973814/139360730-df3b1050-b03a-41e9-829e-6808c4e6d11b.jpg)


### Soal 4
Buat juga reverse domain untuk domain utama

### Jawaban Soal 4
***Server EniesLobby***

Edit file `/etc/bind/named.conf.local` menjadi sebagai berikut:
```
zone "franky.t05.com" {  
        type master;  
        file "/etc/bind/kaizoku/franky.t05.com";  
};

zone "2.44.10.in-addr.arpa" {
        type master;
        file "/etc/bind/kaizoku/2.44.10.in-addr.arpa";
};
```
- dan lakukan konfigurasi pada file `/etc/bind/kaizoku/2.44.10.in-addr.arpa` seperti berikut ini:
```
$TTL    604800  
@       IN      SOA     franky.t07.com. root.franky.t05.com. (
                        2021100401      ; Serial
                        604800          ; Refresh
                        86400         ; Retry
                        2419200         ; Expire
                        604800 )       ; Negative Cache TTL
;
2.44.10.in-addr.arpa.   IN      NS      franky.t05.com.
2                       IN      PTR     franky.t05.com.
```

***TESTING***

cek dengan cara `host -t PTR 10.44.2.2`
![messageImage_1635414542063](https://user-images.githubusercontent.com/61973814/139451800-76ee83a3-ea4d-45e2-b3a9-bcdd74dea4d0.jpg)

### Soal 5
Supaya tetap bisa menghubungi Franky jika server EniesLobby rusak, maka buat Water7 sebagai DNS Slave untuk domain utama

### Jawaban Soal 5
***Server EniesLobby***

- lakukan konfigurasi pada `file /etc/bind/named.conf.local` sebagai berikut untuk melakukan konfigurasi `DNS Slave` yang mengarah ke `water7` :
```
zone "franky.t05.com" {  
        type master;
        notify yes;
        also-notify {10.44.2.3;};  //Masukan IP Water7 tanpa tanda petik
        allow-transfer {10.44.2.3;}; // Masukan IP Water7 tanpa tanda petik
        file "/etc/bind/kaizoku/franky.t05.com";
};
  
zone "2.44.10.in-addr.arpa" {
        type master;
        file "/etc/bind/kaizoku/2.44.10.in-addr.arpa";
};
```

- Lalu lakukan restart sevice bind9 dengan `service bind9 restart`

***Server Water7***

- jalankan command sebelum melakukan konfigurasi
```
apt-get update
apt-get install bind9 -y
```

- Kemudian buka file `/etc/bind/named.conf.local` pada `Water7` dan tambahkan syntax berikut:
```
zone "franky.t05.com" {
        type slave;
        masters { 10.44.2.2; }; // Masukan IP EniesLobby tanpa tanda petik
        file "/var/lib/bind/franky.t05.com";
};
```

- lakukan restart sevice bind9 dengan `service bind9 restart`

***TESTING**

- Pada server `EniesLobby` silahkan matikan service bind9 dengan cara `service bind9 stop`

![messageImage_1635415105403](https://user-images.githubusercontent.com/61973814/139454046-1e765223-0549-4941-ab5f-ec32d288de93.jpg)

Melakukan ping dengan server Longuetown

![messageImage_1635415217858](https://user-images.githubusercontent.com/61973814/139454092-3e7e41aa-9305-4c56-80dc-c8fb7570d5c0.jpg)

### Soal 7
Setelah itu terdapat subdomain `mecha.franky.yyy.com` dengan alias `www.mecha.franky.yyy.com` yang didelegasikan dari `EniesLobby` ke `Water7` dengan IP menuju ke `Skypie` dalam folder `sunnygo`

### Jawaban Soal 7
***Server EniesLobby***

- lakukan konfigurasi pada file `/etc/bind/kaizoku/franky.t05.com`
```
$TTL    604800
@       IN      SOA     franky.t05.com. root.franky.t05.com. (
                        2021100401      ; Serial
                        604800          ; Refresh
                        86400           ; Retry
                        2419200         ; Expire
                        604800 )        ; Negative Cache TTL
;
@               IN      NS      franky.t05.com.
@               IN      A       10.44.2.4 ; IP skypea
www             IN      CNAME   franky.t05.com.
super           IN      A       10.44.2.4 ; IP skypea
www.super       IN      CNAME   super.franky.t05.com.
ns1             IN      A       10.44.2.3; IP Water7
mecha           IN      NS      ns1
```

- Kemudian edit file `/etc/bind/named.conf.options` dan comment pada bagian `dnssec-validation auto;` dan tambahkan baris berikut pada `/etc/bind/named.conf.options`
```
allow-query{any;};  
```

- Kemudian edit file `/etc/bind/named.conf.local` menjadi seperti
```
zone "franky.t05.com" {
        type master;
        //notify yes;
        //also-notify {10.44.2.3;};  Masukan IP Water7 tanpa tanda petik
        allow-transfer {10.44.2.3;}; // Masukan IP Water7 tanpa tanda petik
        file "/etc/bind/kaizoku/franky.t05.com";
};

zone "2.44.10.in-addr.arpa" {
        type master;
        file "/etc/bind/kaizoku/2.44.10.in-addr.arpa";
};
```
- Melakukan restart sevice bind9 dengan `service bind9 restart`
***Server Water7***

- Edit file `/etc/bind/named.conf.options` dan comment pada bagian `dnssec-validation auto;`
- dan tambahkan baris berikut pada `/etc/bind/named.conf.options`
```
allow-query{any;}; 
```

- kemudian edit file `/etc/bind/named.conf.local` untuk delegasi `mecha.franky.t05.com`
```
zone "franky.t05.com" {
    type slave;
    masters { 10.44.2.2; }; // Masukan IP EniesLobby tanpa tanda petik
    file "/var/lib/bind/franky.t05.com";
};  
  
zone "mecha.franky.t05.com"{  
        type master;
        file "/etc/bind/sunnygo/mecha.franky.t05.com";
};  
```

- buat sebuah direktori `mkdir /etc/bind/sunnygo`
- Lakukan konfigurasi pada file `/etc/bind/sunnygo/mecha.franky.t05.com`
```
$TTL    604800
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
```

- lakukan restart sevice bind9 dengan `service bind9 restart`

***TESTING***

- ping `mecha.franky.t05.com`
![messageImage_1635415283662](https://user-images.githubusercontent.com/61973814/139458580-63e7be0a-803e-4c5f-9026-705825b8daa9.jpg)

- ping `www.mecha.franky.t05.com`
![messageImage_1635415308414](https://user-images.githubusercontent.com/61973814/139458652-ca464cb2-2229-4d97-a2d3-a60e8c08ddd5.jpg)

cek `alias/CNAME` dengan cara `host -t CNAME www.mecha.franky.t05.com`
![messageImage_1635415563605](https://user-images.githubusercontent.com/61973814/139458842-d0fb53fb-f7b8-42ee-857c-17eae8294b45.jpg)
