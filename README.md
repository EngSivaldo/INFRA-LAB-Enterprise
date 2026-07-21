# INFRA-LAB Enterprise

Laboratório de Infraestrutura Corporativa desenvolvido para o estudo prático de Administração Linux, Redes, Servidores, DevOps e Cloud Computing.

---

# Objetivos

- Administração Linux
- Redes TCP/IP
- Virtualização com VirtualBox
- DHCP
- DNS (BIND9)
- Apache HTTP Server
- PHP
- MariaDB
- Nginx
- Squid Proxy (em desenvolvimento)
- Docker
- Kubernetes
- Terraform
- AWS Cloud

---

# Arquitetura Atual

```
                    Internet
                        │
                 Rede Doméstica
                        │
                192.168.0.0/24
                        │
                 Debian Router
        192.168.0.200 / 10.200.0.1
                        │
        ┌───────────────┼───────────────┐
        │               │               │
 Debian Apache      Ubuntu Client    Windows 11
   10.200.0.102                         10.200.0.103
        │
     Apache
     PHP
     MariaDB

                Kali Linux
      Testes de Segurança e Rede
```

---

# Infraestrutura

## Debian Router

Funções:

- Gateway
- NAT
- DHCP Server
- DNS Server (BIND9)
- Nginx

---

## Debian Apache

Funções:

- Apache HTTP Server
- Virtual Hosts
- PHP 8.4
- MariaDB 11
- Hospedagem de aplicações Web

---

## Ubuntu Desktop

Cliente Linux utilizado para:

- Testes DNS
- Testes HTTP
- Diagnóstico
- Administração

---

## Windows 11

Cliente corporativo utilizado para:

- DHCP
- DNS
- Testes HTTP
- Navegação
- Validação da infraestrutura

---

## Kali Linux

Utilizado para:

- Diagnóstico
- Segurança
- Pentest
- Ferramentas de Rede

---

# Serviços Implementados

| Serviço | Status |
|----------|:------:|
| NAT | ✅ |
| DHCP | ✅ |
| DNS BIND9 | ✅ |
| Apache | ✅ |
| Virtual Hosts | ✅ |
| PHP 8.4 | ✅ |
| MariaDB 11 | ✅ |
| Resolução DNS Linux | ✅ |
| Resolução DNS Windows | ✅ |
| Comunicação Cliente → Apache | ✅ |
| Squid Proxy | ⏳ |
| HTTPS | ⏳ |
| Docker | ⏳ |
| Kubernetes | ⏳ |
| Terraform | ⏳ |
| AWS | ⏳ |

---

# Rede

## Rede Externa

```
192.168.0.0/24
```

---

## Rede Interna

```
10.200.0.0/24
```

Gateway

```
10.200.0.1
```

Servidor DNS

```
10.200.0.1
```

Servidor Apache

```
10.200.0.102
```

Cliente Windows

```
10.200.0.103
```

---

# Tecnologias Utilizadas

- Debian 13
- Apache HTTP Server
- PHP 8.4
- MariaDB 11
- BIND9
- ISC DHCP Server
- Nginx
- VirtualBox
- Windows 11
- Ubuntu Desktop
- Kali Linux
- Git
- GitHub

---

# Estrutura do Projeto

```
INFRA-LAB-Enterprise/

├── configs/
├── diagrams/
├── docs/
├── images/
├── labs/
├── scripts/
│   ├── health-check.sh
│   ├── network-check.sh
│   └── service-check.sh
└── README.md
```

---

# Aprendizados

Durante este laboratório foram praticados:

- Administração Linux
- Estrutura de Diretórios
- Gerenciamento de Serviços
- Configuração de Rede
- DHCP
- DNS Corporativo
- Apache VirtualHost
- PHP
- MariaDB
- Troubleshooting
- Diagnóstico de Infraestrutura
- Git e GitHub

---

# Roadmap

## Infraestrutura

- [x] NAT
- [x] DHCP
- [x] DNS
- [x] Apache
- [x] PHP
- [x] MariaDB
- [ ] Squid Proxy
- [ ] HTTPS
- [ ] NFS
- [ ] Samba

## DevOps

- [ ] Docker
- [ ] Docker Compose
- [ ] Kubernetes
- [ ] Terraform
- [ ] Ansible
- [ ] GitHub Actions

## Cloud

- [ ] AWS EC2
- [ ] AWS VPC
- [ ] AWS IAM
- [ ] AWS S3
- [ ] AWS Route 53

---

# Objetivo do Projeto

Construir uma infraestrutura corporativa completa, documentada e reproduzível, simulando um ambiente utilizado em empresas, com foco em Administração Linux, Redes, DevOps e Cloud Computing.

---

# Autor

**Sivaldo Vieira de Almeida**

Bacharel em Engenharia de Software

Projeto de estudos em Infraestrutura, Linux, DevOps e Cloud.