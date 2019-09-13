#!/usr/bin/env bash
set -e
export OCP_PIPELINE_CLI_VERSION='0.0.6'
export OCP_PIPELINE_CLI_URL="https://raw.githubusercontent.com/BCDevOps/ocp-cd-pipeline/v${OCP_PIPELINE_CLI_VERSION}/src/main/resources/pipeline-cli"

<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
curl -sSL "${OCP_PIPELINE_CLI_URL}" | bash -s deploy --config=config.groovy --pr=4 --env=dev
=======
curl -sSL "${OCP_PIPELINE_CLI_URL}" | bash -s deploy --config=config.groovy --pr=0 --env=dev
>>>>>>> a9c9ff2... add jenkins build/deploy config
=======
curl -sSL "${OCP_PIPELINE_CLI_URL}" | bash -s deploy --config=config.groovy --pr=4 --env=dev
>>>>>>> dd6c02e... Test Jenkinsfile
=======
curl -sSL "${OCP_PIPELINE_CLI_URL}" | bash -s deploy --config=config.groovy --pr=4 --env=dev
>>>>>>> 06a577d... Containerized UI, API, DB & Caddy Proxy  (#315)
