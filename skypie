echo "nameserver 192.168.122.1" > /etc/resolv.conf
apt-get update
# nomor 8
apt-get install apache2 -y
service apache2 start
apt-get install php -y
apt-get install libapache2-mod-php7.0 -y
service apache2 
apt-get install ca-certificates openssl -y
apt-get install git -y
apt-get install unzip -y
git clone https://github.com/FeinardSlim/Praktikum-Modul-2-Jarkom.git
unzip -o /root/Praktikum-Modul-2-Jarkom/\*.zip -d /root/Praktikum-Modul-2-Jarkom
echo "
<VirtualHost *:80>
        ServerAdmin webmaster@localhost
        DocumentRoot /var/www/franky.t05.com
        ServerName franky.t05.com
        ServerAlias www.franky.t05.com
        ErrorLog \${APACHE_LOG_DIR}/error.log
        CustomLog \${APACHE_LOG_DIR}/access.log combined
</VirtualHost>
" > /etc/apache2/sites-available/franky.t05.com.conf
a2ensite franky.t05.com
mkdir /var/www/franky.t05.com
cp -r /root/Praktikum-Modul-2-Jarkom/franky/. /var/www/franky.t05.com
service apache2 restart

# nomor 9
a2enmod rewrite
service apache2 restart
echo "
RewriteEngine On
RewriteCond %{REQUEST_FILENAME} !-f
RewriteCond %{REQUEST_FILENAME} !-d
RewriteRule (.*) /index.php/\$1 [L]
" >/var/www/franky.t05.com/.htaccess
echo "
<VirtualHost *:80>
        ServerAdmin webmaster@localhost
        DocumentRoot /var/www/franky.t05.com
        ServerName franky.t05.com
        ServerAlias www.franky.t05.com
        ErrorLog \${APACHE_LOG_DIR}/error.log
        CustomLog \${APACHE_LOG_DIR}/access.log combined
        <Directory /var/www/franky.t05.com>
                Options +FollowSymLinks -Multiviews
                AllowOverride All
        </Directory>
</VirtualHost>
" > /etc/apache2/sites-available/franky.t05.com.conf
service apache2 restart

# nomor 10
echo "
<VirtualHost *:80>
        ServerAdmin webmaster@localhost
        DocumentRoot /var/www/super.franky.t05.com
        ServerName super.franky.t05.com
        ServerAlias www.super.franky.t05.com
        ErrorLog \${APACHE_LOG_DIR}/error.log
        CustomLog \${APACHE_LOG_DIR}/access.log combined
        <Directory /var/www/franky.t05.com>
                Options +FollowSymLinks -Multiviews
                AllowOverride All
        </Directory>
</VirtualHost>
" > /etc/apache2/sites-available/super.franky.t05.com.conf
a2ensite super.franky.t05.com
mkdir /var/www/super.franky.t05.com
cp -r /root/Praktikum-Modul-2-Jarkom/super.franky/. /var/www/super.franky.t05.com
service apache2 restart
echo "<?php echo 'yes nomor 10' ?>" > /var/www/super.franky.t05.com/index.php

# nomor 11

echo "
<VirtualHost *:80>
        ServerAdmin webmaster@localhost
        DocumentRoot /var/www/super.franky.t05.com
        ServerName super.franky.t05.com
        ServerAlias www.super.franky.t05.com
        <Directory /var/www/super.franky.t05.com/public>
                Options +Indexes
        </Directory>
        ErrorLog \${APACHE_LOG_DIR}/error.log
        CustomLog \${APACHE_LOG_DIR}/access.log combined
        <Directory /var/www/franky.t05.com>
                Options +FollowSymLinks -Multiviews
                AllowOverride All
        </Directory>
</VirtualHost>
" > /etc/apache2/sites-available/super.franky.t05.com.conf
service apache2 restart

# nomor 12
echo "
<VirtualHost *:80>
        ServerAdmin webmaster@localhost
        DocumentRoot /var/www/super.franky.t05.com
        ServerName super.franky.t05.com
        ServerAlias www.super.franky.t05.com
        ErrorDocument 404 /error/404.html
        ErrorDocument 500 /error/404.html
        ErrorDocument 502 /error/404.html
        ErrorDocument 503 /error/404.html
        ErrorDocument 504 /error/404.html
        <Directory /var/www/super.franky.t05.com/public>
                Options +Indexes
        </Directory>
        ErrorLog \${APACHE_LOG_DIR}/error.log
        CustomLog \${APACHE_LOG_DIR}/access.log combined
        <Directory /var/www/franky.t05.com>
                Options +FollowSymLinks -Multiviews
                AllowOverride All
        </Directory>
</VirtualHost>
" > /etc/apache2/sites-available/super.franky.t05.com.conf
service apache2 restart

# nomor 13
echo "
<VirtualHost *:80>
        ServerAdmin webmaster@localhost
        DocumentRoot /var/www/super.franky.t05.com
        ServerName super.franky.t05.com
        ServerAlias www.super.franky.t05.com
        ErrorDocument 404 /error/404.html
        ErrorDocument 500 /error/404.html
        ErrorDocument 502 /error/404.html
        ErrorDocument 503 /error/404.html
        ErrorDocument 504 /error/404.html
        <Directory /var/www/super.franky.t05.com/public>
                Options +Indexes
        </Directory>
        Alias \"/js\" \"/var/www/super.franky.t05.com/public/js\"
        ErrorLog \${APACHE_LOG_DIR}/error.log
        CustomLog \${APACHE_LOG_DIR}/access.log combined
        <Directory /var/www/franky.t05.com>
                Options +FollowSymLinks -Multiviews
                AllowOverride All
        </Directory>
</VirtualHost>
" > /etc/apache2/sites-available/super.franky.t05.com.conf
service apache2 restart

# nomor 14

echo "
<VirtualHost *:15000>
        ServerAdmin webmaster@localhost
        DocumentRoot /var/www/general.mecha.franky.t05.com
        ServerName general.mecha.franky.t05.com
        ServerAlias www.general.mecha.franky.t05.com
        ErrorLog \${APACHE_LOG_DIR}/error.log
        CustomLog \${APACHE_LOG_DIR}/access.log combined
</VirtualHost>
<VirtualHost *:15500>        
        ServerAdmin webmaster@localhost
        DocumentRoot /var/www/general.mecha.franky.t05.com
        ServerName general.mecha.franky.t05.com
        ServerAlias www.general.mecha.franky.t05.com
        
        ErrorLog \${APACHE_LOG_DIR}/error.log
        CustomLog \${APACHE_LOG_DIR}/access.log combined
</VirtualHost>
" > /etc/apache2/sites-available/general.mecha.franky.t05.com.conf
a2ensite general.mecha.franky.t05.com
service apache2 restart
mkdir /var/www/general.mecha.franky.t05.com
cp -r /root/Praktikum-Modul-2-Jarkom/general.mecha.franky/. /var/www/general.mecha.franky.t05.com/
echo "
<?php
        echo 'selamat 14';
?>
" > /var/www/general.mecha.franky.t05.com/index.php
echo "
# If you just change the port or add more ports here, you will likely also
# have to change the VirtualHost statement in
# /etc/apache2/sites-enabled/000-default.conf
Listen 80
Listen 15000
Listen 15500
<IfModule ssl_module>
        Listen 443
</IfModule>
<IfModule mod_gnutls.c>
        Listen 443
</IfModule>
" > /etc/apache2/ports.conf

service apache2 restart

# nomor 15
htpasswd -c -b /etc/apache2/.htpasswd luffy onepiece

echo "
<VirtualHost *:15000>
        ServerAdmin webmaster@localhost
        DocumentRoot /var/www/general.mecha.franky.t05.com
        ServerName general.mecha.franky.t05.com
        ServerAlias www.general.mecha.franky.t05.com
        <Directory \"/var/www/general.mecha.franky.t05.com\">
                AuthType Basic
                AuthName \"Restricted Content\"
                AuthUserFile /etc/apache2/.htpasswd
                Require valid-user
        </Directory>
        ErrorLog \${APACHE_LOG_DIR}/error.log
        CustomLog \${APACHE_LOG_DIR}/access.log combined
</VirtualHost>
<VirtualHost *:15500>        
        ServerAdmin webmaster@localhost
        DocumentRoot /var/www/general.mecha.franky.t05.com
        ServerName general.mecha.franky.t05.com
        ServerAlias www.general.mecha.franky.t05.com
        
        <Directory \"/var/www/general.mecha.franky.t05.com\">
                AuthType Basic
                AuthName \"Restricted Content\"
                AuthUserFile /etc/apache2/.htpasswd
                Require valid-user
        </Directory>
        
        ErrorLog \${APACHE_LOG_DIR}/error.log
        CustomLog \${APACHE_LOG_DIR}/access.log combined
</VirtualHost>
" > /etc/apache2/sites-available/general.mecha.franky.t05.com.conf
service apache2 restart

# nomor 16

echo "
<VirtualHost *:80>
        ServerAdmin webmaster@localhost
        DocumentRoot /var/www/html
        RewriteEngine On
        RewriteCond %{HTTP_HOST} !^franky.t05.com$
        RewriteRule /.* http://franky.t05.com/ [R]
        ErrorLog \${APACHE_LOG_DIR}/error.log
        CustomLog \${APACHE_LOG_DIR}/access.log combined
</VirtualHost>
" > /etc/apache2/sites-available/000-default.conf
service apache2 restart

# nomor 17
echo "
RewriteEngine On
RewriteCond %{REQUEST_URI} ^/public/images/(.*)franky(.*)
RewriteCond %{REQUEST_URI} !/public/images/franky.png
RewriteRule /.* http://super.franky.t05.com/public/images/franky.png [L]
" > /var/www/super.franky.t05.com/.htaccess

echo "
<VirtualHost *:80>
        ServerAdmin webmaster@localhost
        DocumentRoot /var/www/super.franky.t05.com
        ServerName super.franky.t05.com
        ServerAlias www.super.franky.t05.com
        ErrorDocument 404 /error/404.html
        ErrorDocument 500 /error/404.html
        ErrorDocument 502 /error/404.html
        ErrorDocument 503 /error/404.html
        ErrorDocument 504 /error/404.html
        <Directory /var/www/super.franky.t05.com/public>
                Options +Indexes
        </Directory>
        Alias \"/js\" \"/var/www/super.franky.t05.com/public/js\"
        <Directory /var/www/super.franky.t05.com>
                Options +FollowSymLinks -Multiviews
                AllowOverride All
        </Directory>
        ErrorLog \${APACHE_LOG_DIR}/error.log
        CustomLog \${APACHE_LOG_DIR}/access.log combined
        <Directory /var/www/franky.t05.com>
                Options +FollowSymLinks -Multiviews
                AllowOverride All
        </Directory>
</VirtualHost>
" > /etc/apache2/sites-available/super.franky.t05.com.conf
service apache2 restart
