#!/usr/bin/env bash

OLLAMA_CONTEXT_LENGTH=32768 OLLAMA_HOST=0.0.0.0 ollama serve &
sudo nixos-firewall-tool open tcp 11434
ollama run huihui_ai/qwen3-vl-abliterated:30b-a3b-instruct-q4_K_M --keepalive -2m
