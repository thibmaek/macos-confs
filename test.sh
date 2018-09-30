#!/usr/bin/env bash
# shellcheck disable=SC2044

shellcheck --version
echo ""

echo "Running static analysis (shellcheck) for installers/..."
for installer in $(find installers/ -type f -name "*.sh"); do
  shellcheck --shell=bash -e SC1091 "$installer"
done;

echo "Running static analysis (shellcheck) for configs/..."
for config in $(find configs/ -type f -name "*.sh"); do
  shellcheck --shell=bash -e SC1091 "$config"
done;
