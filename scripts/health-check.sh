#!/bin/bash
#
# Script: health-check.sh
#
# Projeto: INFRA-LAB Enterprise
#
# Objetivo:
#   Realizar verificações básicas de saúde do servidor Linux.
#
# Autor:
#   Sivaldo Vieira
#
# Versão:
#   1.0
#
mostrar_informacoes_sistema()
{
    echo "===== INFORMAÇÕES DO SISTEMA ====="

    echo "Servidor:"
    hostname

    echo "Usuário:"
    whoami

    echo "Data e hora:"
    date

    echo "Tempo ativo:"
    uptime
}

mostrar_memoria()
{
    echo "===== MEMÓRIA DO SISTEMA ====="

    free -h
}

mostrar_disco()
{
    echo "===== USO DE DISCO ====="

    df -h /
}

mostrar_informacoes_sistema
mostrar_memoria
mostrar_disco
