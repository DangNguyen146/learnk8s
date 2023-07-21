# Install k8s

    ansible-playbook -i hosts playbook.yaml

## After run

    sudo mkdir -p /etc/containerd
    sudo containerd config default | sudo tee /etc/containerd/config.toml
    sudo sed -i 's/SystemdCgroup = true/SystemdCgroup = false/g' /etc/containerd/config.toml
    sudo systemctl restart containerd
    sudo systemctl enable containerd

## Start k8s

    sudo kubeadm config images pull
    kubeadm init --apiserver-advertise-address=192.168.144.10 --pod-network-cidr=192.168.0.0/16

## Install k9s

    curl -sS https://webinstall.dev/k9s | bash
    source ~/.config/envman/PATH.env