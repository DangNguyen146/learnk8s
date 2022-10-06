+ staging: http://staging-jenkins.vietnamworks.com/job/VNW-Staging/job/pipeline/job/Schedule/job/backup-incremental-mysql-db1-daily/

 

+ release: https://release-jenkins.vietnamworks.com/job/Releases/job/pipeline/job/Schedule/job/backup-incremental-mysql-db1-daily/configure

- view floder [backup-incremental-mysql-db2-daily]

- view docker
[root@Staging-DB01 _data]# docker ps
CONTAINER ID   IMAGE                                                      COMMAND                  CREATED         STATUS        PORTS                     NAMES
a296768ec712   release-registry.vietnamworks.com/vnw/centos7-mysql51-v1   "/entrypoint.sh mysq…"   2 months ago    Up 2 months   0.0.0.0:33306->3306/tcp   vnw-core-dbnew
13def563ed35   docker.elastic.co/beats/packetbeat:8.1.2                   "/usr/bin/tini -- /u…"   5 months ago    Up 2 months                             packetbeat
f49b84394def   release-registry.vietnamworks.com/vnw/centos7-mysql51-v1   "/entrypoint.sh mysq…"   21 months ago   Up 6 weeks    0.0.0.0:3306->3306/tcp    master-db



-view data
[root@Staging-DB01 _data]# docker inspect f49b84394def
[
    {
        "Id": "f49b84394def496e53cf503b7530c3bedb4559373d16169ef8e494e7035b1a9c",
        "Created": "2020-12-23T07:38:30.205685996Z",
        "Path": "/entrypoint.sh",
        "Args": [
            "mysqld"
        ],
        "State": {
            "Status": "running",
            "Running": true,
            "Paused": false,
            "Restarting": false,
            "OOMKilled": false,
            "Dead": false,
            "Pid": 16580,
            "ExitCode": 0,
            "Error": "",
            "StartedAt": "2022-08-05T10:15:47.120074369Z",
            "FinishedAt": "2022-08-05T10:03:39.467910163Z"
        },
        "Image": "sha256:fd071ceb0e708e584bc03d7dac199150b0c79895b02d5b7c6fc0679d981f80b4",
        "ResolvConfPath": "/data/docker/containers/f49b84394def496e53cf503b7530c3bedb4559373d16169ef8e494e7035b1a9c/resolv.conf",
        "HostnamePath": "/data/docker/containers/f49b84394def496e53cf503b7530c3bedb4559373d16169ef8e494e7035b1a9c/hostname",
        "HostsPath": "/data/docker/containers/f49b84394def496e53cf503b7530c3bedb4559373d16169ef8e494e7035b1a9c/hosts",
        "LogPath": "/data/docker/containers/f49b84394def496e53cf503b7530c3bedb4559373d16169ef8e494e7035b1a9c/f49b84394def496e53cf503b7530c3bedb4559373d16169ef8e494e7035b1a9c-json.log",
        "Name": "/master-db",
        "RestartCount": 0,
        "Driver": "overlay2",
        "Platform": "linux",
        "MountLabel": "",
        "ProcessLabel": "",
        "AppArmorProfile": "",
        "ExecIDs": [
            "b9e41c76b42170a50a73e07c1e42247dbe5b6db706ebf9e5fa728a8f1e8d5c93",
            "469d1a2c6bac04f164195c455fd2fa8c86ac97cdeaa81abfeb2d1da68310499a",
            "db39920c35612f46f67a0e3d0381feb339b9bb6511448d6dc73d7b85bea0f651",
            "b286bd3dd5fe4db15868518a975725777835314518ae79d2de5180801afd8720",
            "dbbb8ffd4b5721f570afd053ab1890d17374a8a82d269a992271aeb8ea5fc6de"
        ],
        "HostConfig": {
            "Binds": [
                "mysql:/data"
            ],
            "ContainerIDFile": "",
            "LogConfig": {
                "Type": "json-file",
                "Config": {}
            },
            "NetworkMode": "default",
            "PortBindings": {
                "3306/tcp": [
                    {
                        "HostIp": "",
                        "HostPort": "3306"
                    }
                ]
            },
            "RestartPolicy": {
                "Name": "always",
                "MaximumRetryCount": 0
            },
            "AutoRemove": false,
            "VolumeDriver": "",
            "VolumesFrom": null,
            "CapAdd": null,
            "CapDrop": null,
            "CgroupnsMode": "host",
            "Dns": [],
            "DnsOptions": [],
            "DnsSearch": [],
            "ExtraHosts": null,
            "GroupAdd": null,
            "IpcMode": "private",
            "Cgroup": "",
            "Links": null,
            "OomScoreAdj": 0,
            "PidMode": "",
            "Privileged": false,
            "PublishAllPorts": false,
            "ReadonlyRootfs": false,
            "SecurityOpt": null,
            "UTSMode": "",
            "UsernsMode": "",
            "ShmSize": 67108864,
            "Runtime": "runc",
            "ConsoleSize": [
                0,
                0
            ],
            "Isolation": "",
            "CpuShares": 0,
            "Memory": 0,
            "NanoCpus": 0,
            "CgroupParent": "",
            "BlkioWeight": 0,
            "BlkioWeightDevice": [],
            "BlkioDeviceReadBps": null,
            "BlkioDeviceWriteBps": null,
            "BlkioDeviceReadIOps": null,
            "BlkioDeviceWriteIOps": null,
            "CpuPeriod": 0,
            "CpuQuota": 0,
            "CpuRealtimePeriod": 0,
            "CpuRealtimeRuntime": 0,
            "CpusetCpus": "",
            "CpusetMems": "",
            "Devices": [],
            "DeviceCgroupRules": null,
            "DeviceRequests": null,
            "KernelMemory": 0,
            "KernelMemoryTCP": 0,
            "MemoryReservation": 0,
            "MemorySwap": 0,
            "MemorySwappiness": null,
            "OomKillDisable": false,
            "PidsLimit": null,
            "Ulimits": null,
            "CpuCount": 0,
            "CpuPercent": 0,
            "IOMaximumIOps": 0,
            "IOMaximumBandwidth": 0,
            "MaskedPaths": [
                "/proc/asound",
                "/proc/acpi",
                "/proc/kcore",
                "/proc/keys",
                "/proc/latency_stats",
                "/proc/timer_list",
                "/proc/timer_stats",
                "/proc/sched_debug",
                "/proc/scsi",
                "/sys/firmware"
            ],
            "ReadonlyPaths": [
                "/proc/bus",
                "/proc/fs",
                "/proc/irq",
                "/proc/sys",
                "/proc/sysrq-trigger"
            ]
        },
        "GraphDriver": {
            "Data": {
                "LowerDir": "/data/docker/overlay2/f7db53515a7734cda36fecddbdb1c955e9c365d1c8786dc566ce4f29c8a0c2b5-init/diff:/data/docker/overlay2/bcb594d40b9abd3b38399cba1adb87fb4f1a89a64fbaa46cb4cf6b27f04e8980/diff:/data/docker/overlay2/aee20403e88f9e3ec05d786bec44d7626bfab8a3c6a8aa2fc5cf7b70ec7f01ed/diff:/data/docker/overlay2/f62937a6a5d0c4ef5ca5aa1307ce03bde52285d3b5a882bcdbfdb602400e2ddf/diff:/data/docker/overlay2/0b23d38bcdc71debcbf69d96cd149cdec777b9cf95a96b281e84bcb4962a38e9/diff:/data/docker/overlay2/1c17d983197c643c5d98c9a470f851a0110a2b05783fb9d5ddbfa34d92e54ae9/diff:/data/docker/overlay2/cb40e5b9a451d575b63f46f374b2a58c05addaa4f9e83b01c4971ad76572eac9/diff:/data/docker/overlay2/b2dd1c5b4e118bc2ace063ead7516b6fc01a60db073bc16e7e0aa367b3da57c0/diff",
                "MergedDir": "/data/docker/overlay2/f7db53515a7734cda36fecddbdb1c955e9c365d1c8786dc566ce4f29c8a0c2b5/merged",
                "UpperDir": "/data/docker/overlay2/f7db53515a7734cda36fecddbdb1c955e9c365d1c8786dc566ce4f29c8a0c2b5/diff",
                "WorkDir": "/data/docker/overlay2/f7db53515a7734cda36fecddbdb1c955e9c365d1c8786dc566ce4f29c8a0c2b5/work"
            },
            "Name": "overlay2"
        },
        "Mounts": [
            {
                "Type": "volume",
                "Name": "mysql",
                "Source": "/data/docker/volumes/mysql/_data",
                "Destination": "/data",
                "Driver": "local",
                "Mode": "z",
                "RW": true,
                "Propagation": ""
            },
            {
                "Type": "volume",
                "Name": "88d1457f8e9fec10eec75b4cd73a81d591c6cf759fea0182a4a683c66283a4c9",
                "Source": "/data/docker/volumes/88d1457f8e9fec10eec75b4cd73a81d591c6cf759fea0182a4a683c66283a4c9/_data",
                "Destination": "/data/mysql",
                "Driver": "local",
                "Mode": "",
                "RW": true,
                "Propagation": ""
            }
        ],
        "Config": {
            "Hostname": "f49b84394def",
            "Domainname": "",
            "User": "",
            "AttachStdin": false,
            "AttachStdout": false,
            "AttachStderr": false,
            "ExposedPorts": {
                "3306/tcp": {}
            },
            "Tty": false,
            "OpenStdin": false,
            "StdinOnce": false,
            "Env": [
                "MYSQL_ROOT_PASSWORD=TuYAZobqSrmY0NLVeLTc",
                "PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/local/mysql/bin:/usr/local/mysql/scripts",
                "container=docker"
            ],
            "Cmd": [
                "mysqld"
            ],
            "Image": "release-registry.vietnamworks.com/vnw/centos7-mysql51-v1",
            "Volumes": {
                "/data/mysql": {}
            },
            "WorkingDir": "/usr/local/mysql",
            "Entrypoint": [
                "/entrypoint.sh"
            ],
            "OnBuild": null,
            "Labels": {
                "org.label-schema.build-date": "20190801",
                "org.label-schema.license": "GPLv2",
                "org.label-schema.name": "CentOS Base Image",
                "org.label-schema.schema-version": "1.0",
                "org.label-schema.vendor": "CentOS"
            }
        },
        "NetworkSettings": {
            "Bridge": "",
            "SandboxID": "1c234b8eb60d5dc71332bb1f1610af4d64758435284a8b3d1941c7f2858c0796",
            "HairpinMode": false,
            "LinkLocalIPv6Address": "",
            "LinkLocalIPv6PrefixLen": 0,
            "Ports": {
                "3306/tcp": [
                    {
                        "HostIp": "0.0.0.0",
                        "HostPort": "3306"
                    }
                ]
            },
            "SandboxKey": "/var/run/docker/netns/1c234b8eb60d",
            "SecondaryIPAddresses": null,
            "SecondaryIPv6Addresses": null,
            "EndpointID": "80b2cf2b2a2015bef1767e0e84336278f06c9ccba3d35decddbee65ae8a9c4e9",
            "Gateway": "172.29.0.1",
            "GlobalIPv6Address": "",
            "GlobalIPv6PrefixLen": 0,
            "IPAddress": "172.29.0.3",
            "IPPrefixLen": 16,
            "IPv6Gateway": "",
            "MacAddress": "02:42:ac:1d:00:03",
            "Networks": {
                "bridge": {
                    "IPAMConfig": null,
                    "Links": null,
                    "Aliases": null,
                    "NetworkID": "b43db073f1966ee132801e3624668bb35e97a28e5d42744c1143e7b87247f1a3",
                    "EndpointID": "80b2cf2b2a2015bef1767e0e84336278f06c9ccba3d35decddbee65ae8a9c4e9",
                    "Gateway": "172.29.0.1",
                    "IPAddress": "172.29.0.3",
                    "IPPrefixLen": 16,
                    "IPv6Gateway": "",
                    "GlobalIPv6Address": "",
                    "GlobalIPv6PrefixLen": 0,
                    "MacAddress": "02:42:ac:1d:00:03",
                    "DriverOpts": null
                }
            }
        }
    }
]

- add ssh key public




### if have error
        @ERROR: access denied to staging-slavedb-daily from unknown (172.16.5.111)
        rsync error: error starting client-server protocol (code 5) at main.c(1649) [sender=3.1.2]

in sever backup

        cat /etc/rsyncd.conf 

    backup_incremental_of_vnwcore