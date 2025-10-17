#!/bin/bash
set -e

./config.sh --unattended \
  --url https://github.com/yesaswinidevipendem/github_lab \
  --token ${RUNNER_TOKEN} \
  --labels docker-runner \
  --name $(hostname)

cleanup() {
  echo "Removing runner..."
  ./config.sh remove --unattended --token ${RUNNER_TOKEN}
}
trap 'cleanup; exit 130' INT
trap 'cleanup; exit 143' TERM

./run.sh
