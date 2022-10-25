server {
    listen 80;
    server_name masayafunakoshi.duckdns.org;

    if ($host = masayafunakoshi.duckdns.org){
        return 301 https://$host$request_url;
    }
}

server {
    listen 443 ssl;
    server_name masayafunakoshi.duckdns.org;

    location / {
        proxy_pass http://myportfolio:5000/;
    }

    # Load the certificate files.
    ssl_certificate /etc/letsencrypt/live/myportfolio/fullchain.pem;
    ssl_certificate_key /etc/letsencrypt/live/myportfolio/privkey.pem;
    ssl_trusted_certificate /etc/letsencrypt/live/myportfolio/chain.pem;
}