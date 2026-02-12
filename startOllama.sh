#!/usr/bin/env bash

if [[ $EUID -ne 0 ]]; then
    echo "$0 is not running as root. Try using sudo."
    exit 1
fi

stopOllama() {
    echo "Stopping Ollama server..."
    pkill ollama
    echo "Ollama server stopped."
    exit 0 
}
 
trap stopOllama SIGINT

OLLAMA_CONTEXT_LENGTH=32768 OLLAMA_HOST=0.0.0.0 ollama serve &
nixos-firewall-tool open tcp 11434
ollama run huihui_ai/qwen3-vl-abliterated:30b-a3b-instruct-q4_K_M --keepalive -2m &

while true; do
    sleep 1
done
