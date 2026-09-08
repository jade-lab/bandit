#!/usr/bin/env bash
set -euo pipefail

export LOCAL_PREFIX="${LOCAL_PREFIX:-bandit}"
export SITE_BASE="${SITE_BASE:-/bandit}"
export CURRENT_YEAR="${CURRENT_YEAR:-2026}"

_tools/build_editions.sh
bundle exec ruby -run -e httpd _site -p 4000 -b 0.0.0.0
