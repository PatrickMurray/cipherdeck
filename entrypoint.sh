#! /usr/bin/env bash


VIRTUALENV_PATH="venv"


if [[ -z "${VIRTUAL_ENV}" ]];
then
        virtualenv          \
          --python=python3  \
          "${VIRTUALENV_PATH}";

        if [[ ${?} -ne 0 ]];
        then
                echo "Failed to create virtualenv: ${VIRTUALENV_PATH}"
                exit -1
        fi


        source "${VIRTUALENV_PATH}/bin/activate"

        if [[ ${?} -ne 0 ]];
        then
                echo "Failed to source virtualenv: ${VIRTUALENV_PATH}/bin/activate"
                exit -1
        fi
fi


pip3       \
  install  \
    -r pip3-requirements.txt;

if [[ ${?} -ne 0 ]];
then
        echo "Failed to install pip3 requirements"
        exit -1
fi


python3 cipherdeck/main.py

if [[ ${?} -ne 0 ]];
then
        echo "Failed to start CipherDeck! :("
        exit -1
fi
