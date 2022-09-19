#### Check config
    docker info

<hr/>

### Create topology
 Topology have 3 machines: vps1, vps2, vps3 ---> Manager by Mac
 Use portainer to manager swarm, vps1 install portainer, when install it create swarm

    docker volume create portainer_data
    docker run -d -p 9000:9000 -p 8000:8000 --name=portainer --restart=always -v /var/run/docker.sock:/var/run/docker.sock -v portainer_data:/data portainer/portainer:latest

 Create machine

    docker-machine create -d virtualbox --virtualbox-hostonly-cidr "192.168.63.1/24" vps1
    docker-machine create -d virtualbox --virtualbox-hostonly-cidr "192.168.63.1/24" vps2
    docker-machine create -d virtualbox --virtualbox-hostonly-cidr "192.168.63.1/24" vps3

View list machine

    docker-machine ls

Conect ssh to machine

    docker-machine ssh vps1
    docker-machine ssh vps2
    docker-machine ssh vps3

##### Create docker swarm
List ip machine

    NAME   ACTIVE   DRIVER       STATE     URL                         SWARM   DOCKER      ERRORS
    vps1   -        virtualbox   Running   tcp://192.168.63.113:2376           v19.03.12   
    vps2   -        virtualbox   Running   tcp://192.168.63.114:2376           v19.03.12   
    vps3   -        virtualbox   Running   tcp://192.168.63.115:2376           v19.03.12   


So create swarm with vps1 is leader

    docker swarm init --advertise-addr=192.168.63.113

 Forgot the code to apply to join swam from other hosts

    docker swarm join-token worker
    docker swarm join --token SWMTKN-1-18onogl62zrusumkbhdhnr9blb1ifixmkvdlaz1ip4is3j25gy-472xjqcn7pru1sfuiu3klhp60 192.168.63.113:2377

<hr/>

## Test with docher swarm
Create 3 project NodeJs with 3 responsive when call them

    res.end("Swarm0000 service(Node0 app), hostname="+ hostname);
    res.end("Swarm1111 service(Node1 app), hostname="+ hostname);

#### Test with Dockerfile
 Start service

    docker service create --name testservice --replicas 5 -p 8085:8085 dangnk/swarmtest:node0 

Delete service

    docker service rm testservice

View container start

    docker stats

Update service

    docker service update --image=dangnk/swarmtest:node1 testservice

View logs

    docker service logs

### Test with docker stack
 Create file docker-compose.yml
 Copy file forwark to vps1
 Create docker stack

    docker stack deploy --compose-file docker-compose.yml t1

#### More
Delete create stack

    docker stack rm t1

View log stack

    docker stack ps --no-trunc t1









