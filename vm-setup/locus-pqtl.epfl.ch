server {
    listen [::]:443 ssl ipv6only=on; # managed by Certbot
    listen 443 ssl; # managed by Certbot

    ssl_certificate /etc/pki/tls/certs/locus-pqtl.epfl.ch.crt.pem;
    ssl_certificate_key /etc/pki/tls/private/locus-pqtl.epfl.ch.key;

    root /var/www/html;

    index index.html index.htm index.nginx-debian.html;

    server_name www.locus-pqtl.epfl.ch locus-pqtl.epfl.ch;

    location / {
	    proxy_pass http://localhost:3838/LOCUS-pqtl-ottawa-diogenes/;
	    proxy_redirect http://localhost:3838/ $scheme:$host/;
    }
}

server {
    if ($host = www.locus-pqtl.epfl.ch) {
        return 301 https://$host$request_uri;
    }

    if ($host = locus-pqtl.epfl.ch) {
        return 301 https://$host$request_uri;
    }

    listen 80 default_server;
    listen [::]:80 default_server;

    server_name www.locus-pqtl.epfl.ch locus-pqtl.epfl.ch;
    return 404;
}

