#!/bin/bash

set -e

THIS_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

function prepare_run_file {
    chmod +x run.sh
}

function install {
    python -m pip install --upgrade pip
    python -m pip install cookiecutter pytest pre-commit
}

function generate-project {
    cookiecutter ./\
        --output-dir "$THIS_DIR"
}

function help {
    echo "$0 <task> <args>"
    echo "Tasks:"
    compgen -A function | cat -n # List all shell function available in the current session
}

TIMEFORMAT="Task completed in %3lR"
time ${@:-help}