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

mostrar_cpu()
{
    echo "===== CPU DO SISTEMA ====="

    echo "Processadores disponíveis:"
    nproc

    echo "Carga do sistema:"
    uptime
}

mostrar_sistema_operacional()
{
    echo "===== SISTEMA OPERACIONAL ====="

    source /etc/os-release

    echo "Distribuição:"
    echo "$PRETTY_NAME"

    echo "ID:"
    echo "$ID"

    echo "Versão:"
    echo "$VERSION_ID"
}
mostrar_informacoes_sistema
mostrar_memoria
mostrar_disco
mostrar_cpu
mostrar_sistema_operacional
