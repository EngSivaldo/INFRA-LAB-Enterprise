# INFRA-LAB Enterprise

# Projeto de Rede (Network Design)

**Documento:** 02-network-design
**Projeto:** INFRA-LAB Enterprise
**Versão:** 1.0
**Status:** Em desenvolvimento

---

# 1. Introdução

Este documento apresenta o projeto de rede do laboratório INFRA-LAB Enterprise.

O objetivo é documentar a arquitetura de comunicação entre servidores e clientes, seguindo conceitos utilizados em ambientes corporativos de infraestrutura.

A rede foi projetada utilizando separação de funções, onde existe uma rede operacional interna e uma interface de gerenciamento administrativo.

---

# 2. Visão Geral da Rede

A infraestrutura utiliza duas redes principais:

## Rede Bridge

Responsável pela comunicação administrativa dos servidores com a rede externa.

Funções:

* Gerenciamento dos servidores;
* Administração pelo ambiente host;
* Comunicação com a rede física.

A Bridge não representa a rede operacional interna do laboratório.

Exemplo de faixa:

```text
192.168.0.0/24
```

---

## Rede Interna Corporativa

Responsável pela comunicação operacional entre servidores e clientes.

Rede:

```text
10.200.0.0/24
```

Características:

* Rede privada;
* Comunicação entre servidores;
* Clientes recebem IP via DHCP;
* Gateway centralizado no servidor Linux.

---

# 3. Topologia Lógica

```text
                         Internet
                            |
                            |
                      Rede Bridge
                            |
                            |
                    debian-router
                            |
          +--------------------------------+
          |                                |
          |                                |
     Gateway Linux                   Serviço Nginx
     DHCP                            NAT
          |
          |
          |
       Rede Interna
       10.200.0.0/24
          |
          |
 ------------------------------------------------
 |                      |                       |
 |                      |                       |
debian-apache        Ubuntu                 Kali
 Apache              Cliente                Cliente
10.200.0.102         DHCP                   DHCP
```

---

# 4. Servidor Gateway

## Hostname

```text
debian-router
```

---

## Função

O servidor `debian-router` é o núcleo da infraestrutura de rede.

Ele realiza a comunicação entre a rede interna do laboratório e a rede externa.

---

## Interfaces de Rede

### Interface Bridge

Função:

* Comunicação externa;
* Acesso à Internet;
* Atualização do sistema.

Exemplo:

```text
192.168.0.x
```

---

### Interface Rede Interna

Função:

* Comunicação com servidores e clientes;
* Gateway da rede interna.

Endereço:

```text
10.200.0.1
```

Máscara:

```text
255.255.255.0
```

Rede:

```text
10.200.0.0/24
```

---

## Serviços Executados

O servidor possui:

* Gateway da rede interna;
* DHCP;
* NAT;
* Nginx.

---

# 5. Servidor Web Apache

## Hostname

```text
debian-apache
```

---

## Função

Servidor responsável pela hospedagem Web utilizando Apache HTTP Server.

---

# 5.1 Interfaces de Rede

## Interface Rede Interna

Função:

* Comunicação operacional;
* Atendimento aos clientes;
* Disponibilização do serviço Apache.

Endereço:

```text
10.200.0.102
```

---

## Interface Bridge

Função:

* Administração do servidor;
* Gerenciamento externo;
* Acesso pelo ambiente host.

Endereço:

```text
192.168.0.100
```

Observação:

A interface Bridge não é utilizada para comunicação dos serviços internos do laboratório.

---

# 6. Clientes da Rede

## Ubuntu

Responsabilidades:

* Estação cliente Linux;
* Testes de conectividade;
* Validação dos serviços.

Recebe endereço automaticamente via DHCP.

---

## Kali Linux

Responsabilidades:

* Testes de rede;
* Diagnóstico;
* Ferramentas de análise;
* Simulação de segurança.

Recebe endereço automaticamente via DHCP.

---

# 7. Tabela de Endereçamento IP

| Equipamento   | Função                 | Interface    | Endereço         |
| ------------- | ---------------------- | ------------ | ---------------- |
| debian-router | Gateway/DHCP/NAT/Nginx | Rede Interna | 10.200.0.1       |
| debian-router | Comunicação externa    | Bridge       | DHCP/Rede Física |
| debian-apache | Servidor Apache        | Rede Interna | 10.200.0.102     |
| debian-apache | Administração          | Bridge       | 192.168.0.100    |
| Ubuntu        | Cliente Linux          | Rede Interna | DHCP             |
| Kali Linux    | Cliente Segurança      | Rede Interna | DHCP             |

---

# 8. Serviço DHCP

O servidor DHCP é responsável pela configuração automática dos clientes.

Informações distribuídas:

* Endereço IP;
* Máscara de rede;
* Gateway;
* DNS.

Rede atendida:

```text
10.200.0.0/24
```

Gateway:

```text
10.200.0.1
```

---

# 9. Serviço NAT

O NAT permite que os clientes da rede interna acessem a Internet utilizando o `debian-router`.

Fluxo:

```text
Ubuntu/Kali
      |
      |
Rede Interna
10.200.0.0/24
      |
      |
debian-router
      |
      |
NAT
      |
      |
Bridge
      |
      |
Internet
```

---

# 10. Serviços Web

## Nginx

Executado no:

```text
debian-router
```

Responsabilidades:

* Serviço HTTP;
* Publicação Web;
* Testes de infraestrutura.

Porta:

```text
80/TCP
```

---

## Apache

Executado no:

```text
debian-apache
```

Responsabilidades:

* Hospedagem Web;
* Simulação de servidor corporativo;
* Testes HTTP.

---

# 11. Comunicação da Infraestrutura

## Comunicação Interna

Exemplo:

```text
Ubuntu
 |
 |
10.200.0.0/24
 |
 |
debian-apache
```

---

## Administração

Exemplo:

```text
WSL/Host
 |
 |
Bridge
 |
 |
Servidor
```

---

# 12. Portas e Protocolos

| Serviço | Porta | Protocolo |
| ------- | ----- | --------- |
| SSH     | 22    | TCP       |
| HTTP    | 80    | TCP       |
| DHCP    | 67/68 | UDP       |

---

# 13. Segurança Básica

Práticas aplicadas:

* Separação entre rede operacional e administração;
* Gateway centralizado;
* Serviços separados por responsabilidade;
* Controle de comunicação entre redes.

---

# 14. Evolução Planejada

O laboratório poderá receber:

* DNS interno;
* Firewall;
* VLANs;
* Monitoramento;
* IDS/IPS;
* Docker;
* Kubernetes;
* Terraform;
* Cloud AWS.

---

# 15. Conclusão

O projeto de rede do INFRA-LAB Enterprise representa uma arquitetura semelhante a ambientes corporativos reais.

A separação entre rede operacional e rede administrativa permite estudar conceitos fundamentais de infraestrutura, Linux, redes e práticas DevOps.

Este documento será utilizado como referência para futuras expansões do laboratório.
