#!/bin/bash

set -e

echo "📦 Instalando dependências: Git, Curl, e Software Essentials..."
sudo apt update && sudo apt install -y \
    git \
    curl \
    wget \
    unzip \
    software-properties-common

echo "🔨 Instalando Terraform..."
sudo apt install -y gnupg
curl -fsSL https://apt.releases.hashicorp.com/gpg | sudo tee /etc/apt/trusted.gpg.d/hashicorp.asc
echo "deb [signed-by=/etc/apt/trusted.gpg.d/hashicorp.asc] https://apt.releases.hashicorp.com $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/hashicorp.list
sudo apt update && sudo apt install -y terraform

echo "🌐 Instalando Ansible..."
sudo apt-add-repository --yes --update ppa:ansible/ansible
sudo apt update && sudo apt install -y ansible

echo "✅ Configuração inicial concluída!"