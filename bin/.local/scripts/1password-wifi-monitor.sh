#!/usr/bin/env bash

set -o pipefail

log_info() {
    echo "$(date) INFO ${1}"
}

get_current_network() {
    ipconfig getifaddr en0
}

is_1password_running() {
    pgrep -x "1Password" &> /dev/null
}

restart_1password() {
    if is_1password_running; then
        log_info "1Password in running, proceeding with restart"

        sleep 3

        pkill -x "1Password"

        while pgrep -x "1Password" &> /dev/null; do
            sleep 0.5
        done

        sleep 1

        launchctl start com.1password.1password-launcher
    else
        log_info "1Password is not running, skipping restart"
    fi
}

REFRESH_SEC=5
LAST_NETWORK=$(get_current_network)

log_info "Started monitoring. Initial network: ${LAST_NETWORK}, refresh interval: ${REFRESH_SEC}s"

while true; do
    CURRENT_NETWORK=$(get_current_network)

    if [[ "${CURRENT_NETWORK}" != "${LAST_NETWORK}" ]]; then
        log_info "Network changed to ${CURRENT_NETWORK}. Restarting 1password..."
        restart_1password
        LAST_NETWORK="${CURRENT_NETWORK}"
    fi

    sleep "${REFRESH_SEC}"
done
