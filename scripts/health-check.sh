#!/bin/bash

# ==========================================================
# INFRA-LAB Enterprise
# Script: health-check.sh
# Descrição: Verificação da saúde do sistema
# ==========================================================

LOG_DIR="/var/log/infra-lab"
LOG_FILE="$LOG_DIR/health.log"

mkdir -p "$LOG_DIR"
touch "$LOG_FILE"

log() {
    echo "$1" | tee -a "$LOG_FILE"
}

mostrar_informacoes_sistema() {
    log "===== INFORMAÇÕES DO SISTEMA ====="

    log "Servidor: $(hostname)"
    log "Usuário: ${SUDO_USER:-$(whoami)}"
    log "Data e hora: $(date)"
    log "Tempo ativo: $(uptime -p)"
}

mostrar_memoria() {
    log ""
    log "===== MEMÓRIA DO SISTEMA ====="

    free -h | tee -a "$LOG_FILE"
}

mostrar_disco() {
    log ""
    log "===== USO DE DISCO ====="

    df -h / | tee -a "$LOG_FILE"
}

mostrar_cpu() {
    log ""
    log "===== CPU DO SISTEMA ====="

    log "Processadores disponíveis:"
    nproc | tee -a "$LOG_FILE"

    log ""

    log "Carga do sistema:"
    uptime | tee -a "$LOG_FILE"
}

mostrar_sistema_operacional() {
    log ""
    log "===== SISTEMA OPERACIONAL ====="

    source /etc/os-release

    log "Distribuição: $PRETTY_NAME"
    log "ID: $ID"
    log "Versão: $VERSION_ID"
}

mostrar_informacoes_sistema
mostrar_memoria
mostrar_disco
mostrar_cpu
mostrar_sistema_operacional
