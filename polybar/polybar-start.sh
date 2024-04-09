#!/bin/bash
killall polybar

config_path=$HOME/.dotfiles/polybar/config.ini

polybar primary-top --config=$config_path | polybar external-top --config=$config_path