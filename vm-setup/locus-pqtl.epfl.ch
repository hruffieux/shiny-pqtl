server {
	listen 80 default_server;
	listen [::]:80 default_server;

	root /var/www/html;

	index index.html index.htm index.nginx-debian.html;

    server_name www.{{ domain }} {{ domain }};

	location / {
		proxy_pass http://localhost:3838/LOCUS-pqtl-ottawa-diogenes/;
		proxy_redirect http://localhost:3838/ $scheme:$host/;
	}
}
