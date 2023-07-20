# Install k8s

    ansible-playbook -i hosts playbook.yaml

## After run

    sudo mkdir -p /etc/containerd
    sudo containerd config default | sudo tee /etc/containerd/config.toml
    sudo sed -i 's/SystemdCgroup = true/SystemdCgroup = false/g' /etc/containerd/config.toml

## Start k8s

    sudo kubeadm config images pull
    kubeadm init --apiserver-advertise-address=192.168.144.10 --pod-network-cidr=192.168.0.0/16