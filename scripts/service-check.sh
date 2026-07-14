#!/bin/bash
#
# Script: service-check.sh
#
# Projeto: INFRA-LAB Enterprise
#
# Objetivo:
#   Verificar o status dos principais serviços do servidor.
#
# Autor:
#   Sivaldo Vieira
#
# Versão:
#   1.0
#

verificar_servico()
{
    SERVICO=$1

    printf "%-20s" "$SERVICO"

    if systemctl is-active --quiet "$SERVICO"
    then
        echo "ATIVO"
    else
        echo "INATIVO"
    fi
}

echo "===== STATUS DOS SERVIÇOS ====="
echo

verificar_servico ssh
verificar_servico nginx
verificar_servico apache2
verificar_servico isc-dhcp-server
