#!/usr/bin/env bash

log_dir="$HOME/Library/Logs/alpaca"
healthy_sleep=3
failure_sleep=15

mkdir -p "$log_dir"

log() {
	printf '%s %s\n' "$(date '+%Y-%m-%d %H:%M:%S')" "$*"
}

while true; do
	if ! ipconfig getifaddr en0 &>/dev/null; then
		log "Not connected to the network, skipping proxy liveness check"
		sleep 10
		continue
	fi

	code=$(curl -s -o /dev/null -w "%{http_code}" --connect-timeout 1 --max-time 2 --proxy http://127.0.0.1:3128 https://clients3.google.com/generate_204)
	curl_status=$?

	log "Proxy check http_code=${code} curl_exit=${curl_status}"

	if [[ $curl_status -ne 0 || $code -ne 204 ]]; then
		log "Proxy check failed; retrying"
		sleep 0.5
		code=$(curl -s -o /dev/null -w "%{http_code}" --connect-timeout 1 --max-time 2 --proxy http://127.0.0.1:3128 https://clients3.google.com/generate_204)
		curl_status=$?
		log "Proxy recheck http_code=${code} curl_exit=${curl_status}"
		if [[ $curl_status -ne 0 || $code -ne 204 ]]; then
			log "Proxy check failed; restarting alpaca"
			brew services restart alpaca
			sleep "$failure_sleep"
			continue
		fi
	fi

	sleep "$healthy_sleep"
done
