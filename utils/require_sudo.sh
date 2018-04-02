#!/usr/bin/env bash

if [[ "$EUID" -ne 0 ]]; then
  echo "[WARN]: Please run this script as root"
  exit 1;
fi
