# INFRA-LAB Enterprise

# Inventário de Servidores (Server Inventory)

**Documento:** 03-server-inventory
**Projeto:** INFRA-LAB Enterprise
**Versão:** 1.0
**Status:** Em desenvolvimento

---

# 1. Introdução

Este documento apresenta o inventário dos servidores que compõem o laboratório INFRA-LAB Enterprise.

O objetivo é registrar informações técnicas dos ativos de infraestrutura, seguindo práticas utilizadas em ambientes profissionais de TI.

O inventário facilita:

* Administração dos servidores;
* Troubleshooting;
* Controle de mudanças;
* Documentação operacional;
* Expansão futura da infraestrutura.

---

# 2. Visão Geral dos Ativos

| Hostname      | Função                       | Sistema Operacional | Status |
| ------------- | ---------------------------- | ------------------- | ------ |
| debian-router | Gateway / DHCP / NAT / Nginx | Debian Linux        | Ativo  |
| debian-apache | Servidor Web Apache          | Debian Linux        | Ativo  |

---

# 3. Servidor: debian-router

## Identificação

| Item                | Informação                 |
| ------------------- | -------------------------- |
| Hostname            | debian-router              |
| Sistema Operacional | Debian Linux               |
| Categoria           | Servidor de Infraestrutura |
| Função Principal    | Gateway de rede            |
| Status              | Ativo                      |

---

## Responsabilidades

O servidor `debian-router` possui as seguintes funções:

* Gateway da rede interna;
* Servidor DHCP;
* Roteamento entre redes;
* NAT para acesso externo;
* Servidor Web Nginx.

---

## Interfaces de Rede

### Interface Bridge

Função:

* Comunicação externa;
* Acesso à Internet;
* Administração.

Endereço:

```text
192.168.0.x
```

---

### Interface Rede Interna

Função:

* Comunicação com servidores e clientes.

Endereço:

```text
10.200.0.1/24
```

---

## Serviços Instalados

| Serviço | Função               | Porta     |
| ------- | -------------------- | --------- |
| DHCP    | Distribuição de IP   | UDP 67/68 |
| Nginx   | Servidor Web         | TCP 80    |
| SSH     | Administração remota | TCP 22    |

---

# 4. Servidor: debian-apache

## Identificação

| Item                | Informação     |
| ------------------- | -------------- |
| Hostname            | debian-apache  |
| Sistema Operacional | Debian Linux   |
| Categoria           | Servidor Web   |
| Função Principal    | Hospedagem Web |
| Status              | Ativo          |

---

## Responsabilidades

O servidor `debian-apache` possui como função:

* Hospedar aplicações Web;
* Disponibilizar serviço HTTP;
* Simular ambiente corporativo de aplicação.

---

## Interfaces de Rede

### Rede Interna

Função:

* Comunicação operacional;
* Atendimento aos clientes.

Endereço:

```text
10.200.0.102/24
```

---

### Interface Bridge

Função:

* Administração;
* Gerenciamento externo.

Endereço:

```text
192.168.0.100
```

Observação:

A interface Bridge não participa da comunicação operacional do laboratório.

---

## Serviços Instalados

| Serviço            | Função               | Porta  |
| ------------------ | -------------------- | ------ |
| Apache HTTP Server | Servidor Web         | TCP 80 |
| SSH                | Administração remota | TCP 22 |

---

# 5. Matriz de Serviços

| Serviço | Servidor Responsável | Objetivo                 |
| ------- | -------------------- | ------------------------ |
| DHCP    | debian-router        | Entrega automática de IP |
| NAT     | debian-router        | Saída para Internet      |
| Nginx   | debian-router        | Serviço Web              |
| Apache  | debian-apache        | Hospedagem Web           |
| SSH     | Ambos                | Administração remota     |

---

# 6. Padrão de Administração

O acesso aos servidores segue o modelo:

```text
Administrador
      |
      |
SSH
      |
      |
Servidor Linux
```

Os serviços são administrados através de:

* SSH;
* systemctl;
* logs Linux;
* ferramentas de diagnóstico.

---

# 7. Monitoramento Futuro

O inventário será expandido futuramente com:

* Uso de CPU;
* Memória RAM;
* Disco;
* Monitoramento de disponibilidade;
* Alertas;
* Métricas.

Ferramentas planejadas:

* Prometheus;
* Grafana;
* Zabbix.

---

# 8. Evolução Planejada

Novos servidores poderão ser adicionados:

| Servidor          | Função                       |
| ----------------- | ---------------------------- |
| debian-dns        | DNS interno                  |
| debian-db         | Banco de dados               |
| debian-fileserver | Compartilhamento de arquivos |
| docker-host       | Containers                   |
| k8s-node          | Kubernetes                   |

---

# 9. Conclusão

O inventário de servidores do INFRA-LAB Enterprise estabelece uma visão organizada dos ativos da infraestrutura.

A documentação permite compreender responsabilidades, serviços e dependências, seguindo uma abordagem semelhante a ambientes profissionais de TI.
