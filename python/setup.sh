#!/usr/bin/env bash

set -e # exit on error

# setup virtual environment
python -m venv --copies --upgrade-deps .

# remove redundant executables
cd bin
rm -v {python,pip}3*
ln -s python{,3}
ln -s python{3,3.14}
ln -s pip{,3}
ln -s pip{3,3.14}

# activate virtual environment
cd ..
. bin/activate

# check that this venv would be used for `python`
[[ $(command -v python) == $PWD/* ]]

# check that this venv would be used for `pip`
[[ $(command -v pip) == $PWD/* ]]

pip install -r ../ESP8266_RTOS_SDK/requirements.txt
pip install requests
