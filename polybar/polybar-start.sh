#!/bin/bash
killall polybar

config_path=~/.dotfiles/polybar/config.ini

polybar primary-top --config=$config_path | polybar external-top --config=$config_path