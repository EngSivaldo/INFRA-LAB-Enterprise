# INFRA-LAB Enterprise

# Catálogo de Serviços de Infraestrutura

**Documento:** 04-service-catalog
**Projeto:** INFRA-LAB Enterprise
**Versão:** 1.0
**Status:** Em desenvolvimento

---

# 1. Introdução

Este documento apresenta o catálogo dos serviços disponíveis no laboratório INFRA-LAB Enterprise.

O objetivo é registrar:

* Serviços ativos;
* Servidores responsáveis;
* Finalidade;
* Portas utilizadas;
* Métodos de validação;
* Evoluções planejadas.

Este modelo segue uma abordagem semelhante a ambientes corporativos de infraestrutura.

---

# 2. Resumo dos Serviços

| Serviço     | Servidor         | Status    |
| ----------- | ---------------- | --------- |
| DHCP        | debian-router    | Ativo     |
| NAT         | debian-router    | Ativo     |
| Nginx       | debian-router    | Ativo     |
| Apache      | debian-apache    | Ativo     |
| SSH         | Servidores Linux | Ativo     |
| DNS Interno | -                | Planejado |

---

# 3. Serviço DHCP

## Servidor responsável

```text
debian-router
```

## Função

Fornecer automaticamente configurações de rede para clientes internos.

Informações distribuídas:

* Endereço IP;
* Máscara;
* Gateway;
* DNS futuro.

Rede atendida:

```text
10.200.0.0/24
```

---

## Validação

Comando:

```bash
ip a
```

Verificar:

* IP recebido;
* Interface ativa.

---

# 4. Serviço NAT

## Servidor responsável

```text
debian-router
```

## Função

Permitir que máquinas da rede interna tenham acesso externo utilizando o gateway Linux.

Fluxo:

```text
Cliente
 |
 |
debian-router
 |
 |
Internet
```

---

## Validação

Teste:

```bash
ping google.com
```

---

# 5. Serviço Nginx

## Servidor responsável

```text
debian-router
```

## Função

Servidor HTTP utilizado para publicação Web e testes de infraestrutura.

Porta:

```text
80/TCP
```

---

## Validação

Status:

```bash
systemctl status nginx
```

Porta:

```bash
ss -tulpn | grep :80
```

Teste:

```bash
curl localhost
```

---

# 6. Serviço Apache

## Servidor responsável

```text
debian-apache
```

## Função

Servidor Web dedicado para hospedagem de aplicações.

Porta:

```text
80/TCP
```

---

## Validação

Status:

```bash
systemctl status apache2
```

Porta:

```bash
ss -tulpn | grep :80
```

Teste:

```bash
curl localhost
```

---

# 7. Serviço SSH

## Servidores responsáveis

```text
debian-router
debian-apache
```

## Função

Administração remota dos servidores Linux.

Porta:

```text
22/TCP
```

---

## Validação

Status:

```bash
systemctl status ssh
```

Teste:

```bash
ssh usuario@servidor
```

---

# 8. Serviço DNS Interno (Planejado)

## Status

Planejado.

## Objetivo

Implementar resolução de nomes internos:

Exemplo:

```text
debian-router.infra.lab
debian-apache.infra.lab
```

Possíveis tecnologias:

* Bind9;
* dnsmasq;
* Unbound.

---

# 9. Padrão de Troubleshooting

A validação dos serviços segue uma sequência:

## 1. Serviço

```bash
systemctl status serviço
```

## 2. Porta

```bash
ss -tulpn
```

## 3. Logs

```bash
journalctl -u serviço
```

## 4. Teste funcional

Exemplo:

```bash
curl
ping
ssh
```

---

# 10. Evolução Planejada

Novos serviços serão adicionados:

* DNS interno;
* Firewall;
* Servidor de arquivos;
* Banco de dados;
* Monitoramento;
* Docker;
* Kubernetes;
* Cloud.

---

# 11. Conclusão

O catálogo de serviços fornece uma visão operacional da infraestrutura do INFRA-LAB Enterprise.

A documentação permite identificar serviços ativos, responsabilidades e procedimentos básicos de validação.

Este documento será atualizado conforme novos componentes forem adicionados ao laboratório.
