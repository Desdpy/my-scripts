#!/usr/bin/env bash

OLLAMA_HOST=0.0.0.0 ollama serve &
sudo nixos-firewall-tool open tcp 11434
ollama run qwen3-vl:8b-instruct-q4_K_M --keepalive -2m
