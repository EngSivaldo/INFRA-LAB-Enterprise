#!/bin/bash
#
# Script: network-check.sh
#
# Projeto: INFRA-LAB Enterprise
#
# Objetivo:
#   Verificar a saúde da rede do servidor.
#
# Autor:
#   Sivaldo Vieira
#
# Versão:
#   1.0
#

mostrar_interfaces()
{
    echo "===== INTERFACES DE REDE ====="

    ip -br addr
}

mostrar_gateway()
{
    echo
    echo "===== GATEWAY PADRÃO ====="

    ip route | grep default
}

mostrar_dns()
{
    echo
    echo "===== SERVIDORES DNS ====="

    grep "nameserver" /etc/resolv.conf
}

mostrar_conectividade()
{
    echo
    echo "===== TESTE DE CONECTIVIDADE ====="

    if ping -c 2 8.8.8.8 > /dev/null 2>&1
    then
        echo "Internet.............. OK"
    else
        echo "Internet.............. FALHA"
    fi

    if ping -c 2 google.com > /dev/null 2>&1
    then
        echo "Resolução DNS......... OK"
    else
        echo "Resolução DNS......... FALHA"
    fi
}

mostrar_interfaces
mostrar_gateway
mostrar_dns
mostrar_conectividade
