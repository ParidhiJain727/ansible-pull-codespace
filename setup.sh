
#!/bin/bash
set -e

echo "Installing Ansible, Git and cron..."

sudo apt-get update -y
sudo apt-get install -y software-properties-common git cron

if ! command -v ansible-pull >/dev/null 2>&1; then
    sudo add-apt-repository --yes --update ppa:ansible/ansible
    sudo apt-get install -y ansible
fi

echo "Starting cron service..."
sudo service cron start

echo "Checking Ansible installation..."
ansible --version

echo "Setup complete."
