Sivaldo, o `01-architecture-overview.md` deve ser atualizado para refletir o estado atual (não mais só Apache/Nginx). Ele deve mostrar a **visão macro da infraestrutura**.

Substitua pelo conteúdo abaixo:

```markdown
# INFRA-LAB Enterprise

# Arquitetura Geral da Infraestrutura

**Documento:** 01-architecture-overview  
**Projeto:** INFRA-LAB Enterprise  
**Versão:** 2.0  
**Status:** Em desenvolvimento  

---

# 1. Visão Geral

O INFRA-LAB Enterprise é um laboratório de infraestrutura corporativa desenvolvido para simular um ambiente real de Tecnologia da Informação.

O projeto tem como objetivo aplicar na prática conhecimentos de:

- Administração Linux;
- Redes TCP/IP;
- Serviços de infraestrutura;
- Servidores Web;
- Banco de Dados;
- Segurança;
- DevOps;
- Cloud Computing.

A arquitetura utiliza servidores com responsabilidades separadas, seguindo princípios utilizados em ambientes corporativos.

---

# 2. Objetivo da Arquitetura

A arquitetura foi planejada para demonstrar:

- Separação de responsabilidades;
- Organização de serviços;
- Administração de servidores;
- Diagnóstico de problemas;
- Documentação técnica;
- Evolução contínua da infraestrutura.

Modelo aplicado:

```

Planejar
↓
Implementar
↓
Testar
↓
Documentar
↓
Evoluir

```

---

# 3. Topologia Geral

O laboratório utiliza VirtualBox com duas redes:

- Rede Bridge para comunicação externa;
- Rede Interna para comunicação corporativa.

Arquitetura atual:

```

```
                     Internet
                        |
                        |
                Rede Física / Bridge
                        |
                        |
                debian-router
          Gateway + NAT + DHCP + DNS
                        |
                        |
             Rede Interna 10.200.0.0/24
                        |
    -----------------------------------------
    |                  |                    |
    |                  |                    |
```

debian-apache        Windows 11           Ubuntu/Kali
Servidor LAMP        Cliente              Clientes

```

---

# 4. Componentes da Infraestrutura

## 4.1 Debian Router

Hostname:

```

debian-router

```

Função:

Servidor central de infraestrutura.

Responsabilidades:

- Gateway da rede interna;
- Roteamento;
- NAT;
- DHCP;
- DNS BIND9;
- Nginx.

Interfaces:

Rede externa:

```

192.168.0.200

```

Rede interna:

```

10.200.0.1/24

```

Serviços:

| Serviço | Status |
|-|-|
| NAT | Ativo |
| DHCP | Ativo |
| DNS BIND9 | Ativo |
| Nginx | Ativo |

---

# 4.2 Debian Apache

Hostname:

```

debian-apache

```

Função:

Servidor Web e Aplicações.

Responsabilidades:

- Apache HTTP Server;
- Virtual Hosts;
- PHP;
- MariaDB;
- Hospedagem de aplicações Web.

IP:

```

10.200.0.102

```

Stack:

```

Linux
|
Apache
|
PHP
|
MariaDB

```

Serviços:

| Serviço | Status |
|-|-|
| Apache | Ativo |
| PHP 8.4 | Ativo |
| MariaDB 11 | Ativo |

Virtual Host:

```

laboratorio.local

```

DocumentRoot:

```

/var/www/laboratorio.local/public_html

```

---

# 4.3 Cliente Windows

Função:

Simular estação corporativa.

Responsabilidades:

- Receber IP via DHCP;
- Utilizar DNS interno;
- Acessar serviços corporativos.

IP atual:

```

10.200.0.103

```

DNS:

```

10.200.0.1

```

Testes realizados:

- Resolução DNS;
- Acesso HTTP;
- Comunicação com Apache.

---

# 4.4 Clientes Linux

## Ubuntu

Responsabilidades:

- Testes de rede;
- Administração;
- Validação dos serviços.

## Kali Linux

Responsabilidades:

- Diagnóstico;
- Segurança;
- Ferramentas de análise.

---

# 5. Serviços Implementados

## DHCP

Responsável pela configuração automática dos clientes.

Rede:

```

10.200.0.0/24

```

Gateway entregue:

```

10.200.0.1

```

DNS entregue:

```

10.200.0.1

```

---

## DNS BIND9

Servidor DNS interno.

Domínio:

```

laboratorio.local

```

Responsável por resolver:

```

laboratorio.local
|
|
10.200.0.102

```

---

## Apache

Servidor Web principal.

Responsável por:

- Sites internos;
- Aplicações PHP;
- Testes HTTP.

---

## MariaDB

Banco de dados utilizado pelas aplicações.

Responsável por:

- Armazenamento;
- Testes de integração PHP + Banco.

---

## Nginx

Servidor Web auxiliar no debian-router.

Uso atual:

- Publicação Web;
- Estudos futuros de proxy reverso.

---

# 6. Princípios Arquiteturais

## Separação de responsabilidades

Cada servidor possui uma função definida.

Exemplo:

- Router controla rede;
- Apache hospeda aplicações;
- Clientes consomem serviços.

---

## Documentação contínua

Toda alteração relevante deve possuir:

- Registro técnico;
- Atualização documental;
- Commit Git.

---

## Reprodutibilidade

A infraestrutura deve permitir que outro administrador consiga:

- Entender;
- Recriar;
- Manter;
- Evoluir o ambiente.

---

# 7. Evolução Planejada

Próximas implementações:

- Squid Proxy;
- HTTPS;
- Servidor de arquivos Samba;
- Monitoramento;
- Docker;
- Kubernetes;
- Terraform;
- AWS.

---

# 8. Conclusão

O INFRA-LAB Enterprise representa uma infraestrutura corporativa simulada, integrando serviços de rede, servidores Web, banco de dados e clientes Windows/Linux.

O projeto segue uma abordagem profissional baseada em:

Planejamento → Implementação → Testes → Documentação → Evolução.
```

Esse documento agora representa o laboratório **real**, não a versão inicial.
