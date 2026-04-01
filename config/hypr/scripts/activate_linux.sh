#!/bin/bash

if pgrep -x "activate-linux" > /dev/null; then
	pkill -x "activate-linux"
else
	activate-linux	-t "Activer Ubuntu" \
					-m "Achetez une licence Pro dans les paramètres." \
					-x 420 \
					-y 90 \
					-c 0.7-0.7-0.7-1 \
					-d
fi
