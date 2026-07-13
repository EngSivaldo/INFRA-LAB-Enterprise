# INFRA-LAB Enterprise

# Arquitetura Geral da Infraestrutura

**Documento:** 01-architecture-overview
**Projeto:** INFRA-LAB Enterprise
**Versão:** 1.0
**Status:** Em desenvolvimento

---

# 1. Visão Geral

O INFRA-LAB Enterprise é um laboratório corporativo de infraestrutura criado com o objetivo de simular um ambiente real de Tecnologia da Informação (TI).

O projeto contempla a construção, configuração e documentação de serviços fundamentais utilizados em ambientes profissionais, incluindo:

* Redes Linux;
* Serviços de infraestrutura;
* Servidores Web;
* Gerenciamento de serviços;
* Segurança básica;
* Automação;
* Práticas DevOps;
* Evolução futura para Cloud Computing.

O laboratório representa uma pequena infraestrutura corporativa onde servidores possuem responsabilidades específicas e clientes acessam serviços disponibilizados pela rede interna.

---

# 2. Objetivo da Arquitetura

A arquitetura foi projetada para demonstrar conhecimentos práticos em:

* Administração Linux;
* Redes TCP/IP;
* Serviços corporativos;
* Troubleshooting;
* Organização de ambientes;
* Documentação técnica.

O objetivo não é apenas configurar serviços, mas aplicar uma abordagem profissional de infraestrutura:

**Planejar → Implementar → Testar → Documentar → Evoluir**

---

# 3. Topologia Geral

A infraestrutura utiliza máquinas virtuais gerenciadas através do VirtualBox.

O ambiente utiliza uma arquitetura baseada em duas redes:

* Interface Bridge para comunicação externa;
* Rede Interna para comunicação corporativa entre servidores e clientes.

Arquitetura atual:

```
                     Internet
                        |
                        |
                 Rede Bridge
                        |
                        |
                debian-router
       Gateway + DHCP + NAT + Nginx
                        |
                        |
          Rede Interna 10.200.0.0/24
                        |
        --------------------------------
        |              |               |
        |              |               |
 debian-apache      Ubuntu           Kali
 Servidor Web       Cliente          Cliente
```

---

# 4. Componentes da Infraestrutura

# 4.1 Servidor de Roteamento e Serviços de Infraestrutura

## Hostname

```
debian-router
```

## Função

O servidor `debian-router` atua como o núcleo da infraestrutura de rede do laboratório.

Ele é responsável pela comunicação entre a rede externa e a rede interna.

## Interfaces de Rede

### Interface Bridge

Responsável pela comunicação com a rede física e acesso externo.

Funções:

* Acesso à Internet;
* Atualização de pacotes;
* Comunicação com a rede local física.

Exemplo de endereço:

```
192.168.0.x
```

---

### Interface Rede Interna

Responsável pela comunicação com os servidores e clientes do laboratório.

Rede:

```
10.200.0.0/24
```

Gateway:

```
10.200.0.1
```

---

## Serviços executados

O servidor possui as seguintes responsabilidades:

* Gateway da rede interna;
* Servidor DHCP;
* Roteamento entre redes;
* NAT para saída dos clientes;
* Servidor Web Nginx;
* Controle da comunicação interna.

---

# 4.2 Servidor Web Apache

## Hostname

```
debian-apache
```

## Responsabilidades

Servidor dedicado à hospedagem Web utilizando Apache HTTP Server.

Funções:

* Hospedagem de aplicações Web;
* Serviço HTTP;
* Simulação de servidor corporativo.

## Interfaces de Rede

Rede interna:

```
10.200.0.102
```

Bridge:

```
192.168.0.100
```

---

# 5. Clientes da Rede

## Ubuntu

Responsabilidades:

* Estação cliente Linux;
* Testes de conectividade;
* Validação dos serviços;
* Acesso aos servidores internos.

---

## Kali Linux

Responsabilidades:

* Testes de rede;
* Diagnóstico de conectividade;
* Ferramentas de análise;
* Simulação de ambiente de segurança.

---

# 6. Serviços Implementados

# DHCP

Responsável por fornecer automaticamente endereços IP aos clientes da rede interna.

Rede:

```
10.200.0.0/24
```

Gateway entregue:

```
10.200.0.1
```

---

# NAT

Responsável por permitir que máquinas da rede interna acessem a Internet utilizando o servidor `debian-router` como gateway.

Fluxo:

```
Cliente interno
       |
       |
Rede Interna
       |
       |
debian-router
       |
       |
Bridge
       |
       |
Internet
```

---

# Nginx

Servidor Web instalado no `debian-router`.

Responsabilidades:

* Publicação de conteúdo Web;
* Testes HTTP;
* Simulação de serviço corporativo;
* Futuro uso como proxy reverso.

Porta utilizada:

```
80/TCP
```

---

# Apache

Servidor Web instalado no `debian-apache`.

Responsabilidades:

* Hospedagem de aplicações Web;
* Testes de comunicação HTTP;
* Separação de responsabilidades entre serviços.

---

# 7. Modelo de Rede

A arquitetura utiliza segmentação baseada em funções:

| Rede                       | Função                                              |
| -------------------------- | --------------------------------------------------- |
| Bridge                     | Comunicação externa com rede física                 |
| Rede Interna 10.200.0.0/24 | Comunicação corporativa entre servidores e clientes |

---

# 8. Princípios Arquiteturais

O projeto segue princípios utilizados em ambientes profissionais.

## Separação de responsabilidades

Cada servidor possui uma função definida.

Exemplo:

* Gateway controla comunicação de rede;
* Servidor Web hospeda aplicações;
* Clientes utilizam serviços disponibilizados.

---

## Documentação contínua

Toda alteração relevante deve possuir:

* Registro técnico;
* Commit Git;
* Histórico de evolução.

---

## Reprodutibilidade

As configurações devem permitir que outro profissional consiga compreender, reconstruir e evoluir o ambiente.

---

# 9. Evolução Planejada

O laboratório será expandido progressivamente com novos componentes:

* DNS interno;
* Servidor de arquivos;
* Banco de dados;
* Monitoramento;
* Docker;
* CI/CD;
* Kubernetes;
* Terraform;
* Cloud AWS.

---

# 10. Conclusão

O INFRA-LAB Enterprise representa uma infraestrutura corporativa simulada, construída com foco em aprendizado prático e demonstração profissional de competências em Linux, Redes, DevOps e Cloud.

Este documento serve como referência arquitetural para todas as próximas implementações do laboratório.
