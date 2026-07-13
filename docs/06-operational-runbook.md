# INFRA-LAB Enterprise

# Manual Operacional da Infraestrutura (Operational Runbook)

**Documento:** 06-operational-runbook
**Projeto:** INFRA-LAB Enterprise
**Versão:** 1.0
**Status:** Em desenvolvimento

---

# 1. Introdução

Este documento apresenta os procedimentos operacionais básicos para administração e manutenção do laboratório INFRA-LAB Enterprise.

O objetivo é fornecer um guia prático para:

* Inicialização do ambiente;
* Validação dos serviços;
* Diagnóstico de problemas;
* Manutenção dos servidores;
* Troubleshooting.

---

# 2. Visão Operacional

A infraestrutura possui os seguintes componentes:

| Servidor      | Função                     |
| ------------- | -------------------------- |
| debian-router | Gateway, DHCP, NAT e Nginx |
| debian-apache | Servidor Web Apache        |
| Ubuntu        | Cliente Linux              |
| Kali Linux    | Cliente de testes          |

---

# 3. Inicialização do Ambiente

Ordem recomendada de inicialização:

## 1º - debian-router

Responsável por fornecer conectividade para a rede interna.

Validar:

```bash
systemctl status networking
```

---

## 2º - debian-apache

Servidor de aplicação Web.

Validar:

```bash
systemctl status apache2
```

---

## 3º - Clientes

Ubuntu e Kali devem receber IP automaticamente via DHCP.

Validar:

```bash
ip a
```

---

# 4. Checklist de Validação Inicial

Após iniciar o ambiente:

## Verificar interfaces

```bash
ip a
```

Confirmar:

* Interface Bridge;
* Interface Rede Interna;
* Endereço IP correto.

---

## Verificar conectividade

Teste local:

```bash
ping 10.200.0.1
```

Teste Internet:

```bash
ping google.com
```

---

# 5. Validação do DHCP

No cliente:

```bash
ip a
```

Verificar:

* IP recebido;
* Gateway;
* Interface ativa.

No servidor:

```bash
systemctl status isc-dhcp-server
```

---

# 6. Validação do NAT

No servidor:

Verificar encaminhamento:

```bash
sysctl net.ipv4.ip_forward
```

Resultado esperado:

```text
net.ipv4.ip_forward = 1
```

Verificar regras:

```bash
sudo iptables -t nat -L
```

---

# 7. Validação do Nginx

Servidor:

```text
debian-router
```

Verificar serviço:

```bash
systemctl status nginx
```

Verificar porta:

```bash
ss -tulpn | grep :80
```

Teste:

```bash
curl localhost
```

---

# 8. Validação do Apache

Servidor:

```text
debian-apache
```

Verificar:

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

# 9. Diagnóstico de Rede

## Verificar endereço IP

```bash
ip a
```

---

## Verificar rota

```bash
ip route
```

---

## Verificar DNS

```bash
cat /etc/resolv.conf
```

---

## Testar comunicação

```bash
ping endereço
```

---

# 10. Diagnóstico de Serviços

Verificar serviços ativos:

```bash
systemctl --type=service
```

Verificar portas:

```bash
ss -tulpn
```

Verificar processos:

```bash
ps aux
```

---

# 11. Análise de Logs

Logs gerais:

```bash
journalctl
```

Logs específicos:

SSH:

```bash
journalctl -u ssh
```

Apache:

```bash
journalctl -u apache2
```

Nginx:

```bash
journalctl -u nginx
```

---

# 12. Troubleshooting Básico

## Problema: Cliente sem IP

Verificar:

1. Serviço DHCP:

```bash
systemctl status isc-dhcp-server
```

2. Interface:

```bash
ip a
```

3. Conectividade:

```bash
ping 10.200.0.1
```

---

## Problema: Serviço Web indisponível

Verificar:

1. Serviço:

```bash
systemctl status serviço
```

2. Porta:

```bash
ss -tulpn
```

3. Logs:

```bash
journalctl -u serviço
```

---

# 13. Procedimento de Alterações

Toda alteração no laboratório deve seguir:

```text
Alterar
   |
Testar
   |
Documentar
   |
Commit Git
   |
Push GitHub
```

---

# 14. Backup e Versionamento

A documentação e configurações do projeto são mantidas através do Git.

Comandos principais:

Ver alterações:

```bash
git status
```

Adicionar:

```bash
git add arquivo
```

Commit:

```bash
git commit -m "descrição"
```

Enviar:

```bash
git push
```

---

# 15. Evolução Futura

O Runbook será expandido com:

* Backup automatizado;
* Monitoramento;
* Alertas;
* Scripts operacionais;
* Automação Ansible;
* Pipeline CI/CD.

---

# 16. Conclusão

O Operational Runbook fornece uma referência operacional para administração do INFRA-LAB Enterprise.

A documentação permite executar manutenção, diagnóstico e evolução do ambiente seguindo práticas utilizadas em equipes profissionais de infraestrutura.
