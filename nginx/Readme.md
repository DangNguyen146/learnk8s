### Add site dangnk.test
        
    sudo ln -s /etc/nginx/sites-available/dangnk.test /etc/nginx/sites-enabled/

### Add site prometheus.test
    sudo htpasswd -c /etc/nginx/.htpasswd admin

Add basic all config
    
    auth_basic "Prometheus server authentication";
	auth_basic_user_file /etc/nginx/.htpasswd;

---

    sudo ln -s /etc/nginx/sites-available/prometheus.test /etc/nginx/sites-enabled/

### Add site grafana.test
    
    sudo ln -s /etc/nginx/sites-available/grafana.test /etc/nginx/sites-enabled/