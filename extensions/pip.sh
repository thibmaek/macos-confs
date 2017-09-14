#!/usr/bin/env bash

packages=(
  bottle
  glances
)

pip install "${packages[@]}"
