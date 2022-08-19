env: staging + release

#### Hơ to do it?
### Step 1: Login and add log
 - Kong release: http://172.16.4.93:1337/#!/users/10
 - Kong staging: http://10.122.4.34:1337/#!/plugins

user: dangnk
password: 4NC6Qnh3LgP6

 -- First, in menuBar left, click Connections 
 -- Secord, active Kong nodes [kong-stag]
 ==> This ApiGetWay 

### Step 2: Add new Plugins
 -- Click [ADD-NEW-GLOBEL-PLUGINS]
 -- Select tab [Logging]
 -- Slect [ADD-UDP-LOG]
            host    172.16.5.75
            port    2514


### config td-agent listen port:
<source>
    @type udp
    @log_level error
    tag kong_access
    format json
    port 2514
    bind 0.0.0.0
</source>
