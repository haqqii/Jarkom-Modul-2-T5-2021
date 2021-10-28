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
- **Foosha sebagai Router**
- **Loguetown sebagai Client**
- **Alabasta sebagai Client**
- **Water7 sebagai DNS Slave**
- **EniesLobby sebagai DNS Master**

```
apt-get update  
apt-get install bind9 -y  
```

### Soal 2
Luffy ingin menghubungi Franky yang berada di EniesLobby dengan denden mushi. Kalian diminta Luffy untuk membuat website utama dengan mengakses franky.yyy.com dengan alias www.franky.yyy.com pada folder kaizoku

### Jawaban Soal 2
**Server EniesLobby**
Melakukan Konfigurasi terhadap file `/etc/bind/named.conf.local` dan menambahkan

```
zone "franky.t05.com" {  
        type master;  
        file "/etc/bind/kaizoku/franky.t05.com";
};
```

- Lalu buat direktory baru bernama `kaizoku`
- Copykan file db.local pada path `/etc/bind` ke dalam folder `kaizoku` yang baru saja dibuat dan ubah namanya menjadi franky.t05.com

```
cp /etc/bind/db.local /etc/bind/kaizoku/franky.t05.com
```

