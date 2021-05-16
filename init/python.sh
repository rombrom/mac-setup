#!/usr/bin/env bash

# update path for this session
export PATH="$HOME/.local/bin:/usr/local/opt/python@3.9/libexec/bin:$PATH"

# install pipx first...
pip install pipx
pip install mccabe
pip install rope

# ...and then the rest
pipx install autoimport
pipx install black
pipx install flake8
pipx install isort
pipx install mypy
pipx install pipenv
pipx install pyflakes
pipx install python-language-server
