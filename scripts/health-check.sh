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

mostrar_informacoes_sistema
