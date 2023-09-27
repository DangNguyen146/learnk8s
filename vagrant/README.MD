# Install vagrant

    vagrant init

## Install machine
Paste script after

## Run command

    vagrant up

## Copy sshkey
    
    ssh ubuntu1@192.168.144.10
    sudo su
    cp /home/ubuntu1/.ssh/authorized_keys ~/.ssh/
    ssh ubuntu2@192.168.144.11
    cp /home/ubuntu2/.ssh/authorized_keys ~/.ssh/
    echo "" > ~/.ssh/known_hosts
