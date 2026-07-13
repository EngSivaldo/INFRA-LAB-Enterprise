# INFRA-LAB Enterprise

# Linha de Base de Segurança (Security Baseline)

**Documento:** 05-security-baseline
**Projeto:** INFRA-LAB Enterprise
**Versão:** 1.0
**Status:** Em desenvolvimento

---

# 1. Introdução

Este documento apresenta as práticas básicas de segurança aplicadas ao laboratório INFRA-LAB Enterprise.

O objetivo é estabelecer uma configuração inicial de segurança semelhante aos procedimentos utilizados em ambientes corporativos.

A segurança da infraestrutura considera:

* Controle de acesso;
* Administração segura;
* Redução de exposição;
* Monitoramento;
* Boas práticas Linux.

---

# 2. Modelo de Segurança

O laboratório utiliza o princípio:

**Menor privilégio necessário**

Cada componente possui uma responsabilidade definida:

* Gateway controla rede;
* Servidores hospedam serviços;
* Clientes consomem recursos.

---

# 3. Controle de Acesso

A administração dos servidores é realizada através de:

```text
SSH - Secure Shell
```

Porta padrão:

```text
22/TCP
```

Fluxo:

```text
Administrador
      |
      |
     SSH
      |
      |
Servidor Linux
```

---

# 4. Servidores Administrados

## debian-router

Funções:

* Gateway;
* DHCP;
* NAT;
* Nginx.

---

## debian-apache

Funções:

* Servidor Web;
* Apache HTTP Server.

---

# 5. Gerenciamento de Usuários

Boas práticas aplicadas:

* Uso de usuários individuais;
* Evitar utilização direta do usuário root;
* Uso de sudo para tarefas administrativas;
* Controle de permissões.

Comandos utilizados:

Ver usuários:

```bash
cat /etc/passwd
```

Ver grupos:

```bash
cat /etc/group
```

Ver permissões:

```bash
ls -la
```

---

# 6. Atualização do Sistema

Manter sistemas atualizados reduz riscos conhecidos.

Processo:

Atualizar lista de pacotes:

```bash
sudo apt update
```

Atualizar pacotes:

```bash
sudo apt upgrade
```

---

# 7. Serviços Expostos

Serviços atualmente utilizados:

| Serviço | Porta     | Servidor         |
| ------- | --------- | ---------------- |
| SSH     | 22/TCP    | Servidores Linux |
| HTTP    | 80/TCP    | Nginx            |
| HTTP    | 80/TCP    | Apache           |
| DHCP    | UDP 67/68 | debian-router    |

---

# 8. Verificação de Portas

A análise de portas é realizada utilizando:

```bash
ss -tulpn
```

Objetivo:

* Identificar serviços ativos;
* Detectar exposições desnecessárias;
* Auxiliar troubleshooting.

---

# 9. Logs e Auditoria

Os registros do sistema são analisados através do systemd journal.

Comando:

```bash
journalctl
```

Exemplo:

```bash
journalctl -u ssh
```

---

# 10. Estado Atual de Segurança

Implementado:

✅ Separação de redes
✅ Controle por SSH
✅ Serviços separados por função
✅ Administração Linux via terminal
✅ Monitoramento básico por logs

---

# 11. Melhorias Futuras

Planejamento:

* Firewall com nftables;
* Fail2ban;
* Chaves SSH;
* Bloqueio de login root;
* Auditoria;
* Centralização de logs;
* Monitoramento;
* IDS/IPS.

---

# 12. Conclusão

A linha de base de segurança estabelece os fundamentos necessários para evolução do INFRA-LAB Enterprise.

O objetivo é evoluir gradualmente de um laboratório Linux para uma infraestrutura próxima de ambientes corporativos reais.
