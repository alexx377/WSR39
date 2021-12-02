#!/bin/bash

COMPETITORS_LOGIN="<competitors login>"
COMPETITORS_REPO="<competitors repo>"
IP_PROJECT_1="0.0.0.0"
IP_PROJECT_2="0.0.0.0"
IP_PROJECT_3="0.0.0.0"

clear

sed -i 's/#display_skipped_hosts.*/display_skipped_hosts False/'

mv /etc/ansible/hosts /etc/ansible/hosts.bak
touch /etc/ansible/hosts
echo "project_1 ansible_host=$IP_PROJECT_1 ansible_user=root ansible_password=toortoor ansible_ssh_port=1834" >> /etc/ansible/hosts
echo "project_2 ansible_host=$IP_PROJECT_2 ansible_user=root ansible_password=toortoor ansible_ssh_port=1834" >> /etc/ansible/hosts
echo "project_3 ansible_host=$IP_PROJECT_3 ansible_user=root ansible_password=toortoor ansible_ssh_port=1834" >> /etc/ansible/hosts

cd /
git clone https://github.com/Janiston14/wsr-skillcloud
ansible-vault decrypt /wsr-skillcloud/Users

git clone https://github.com/$COMPETITORS_LOGIN/$COMPETITORS_REPO
cd /$COMPETITORS_REPO

echo "---"
echo "Competitors YML scripts:"
echo ""
ls *yml
echo "---"

echo "Ready! You must run competitors ansible playbook script. After that you may run ./check.sh"
