#!/bin/bash

DURATION=200
SPIN_DURATION=50
RATELIMIT=0.2
HOST=test.mosquitto.org

while true; do
read -rsn1 input
if [ "$input" = "w" ]; then
    echo "pressed w, going forward"
    mosquitto_pub -h $HOST -t "miniwheels1/wheels" -m "1023 0 1 1023 0 1 $DURATION"
elif [ "$input" = "a" ]; then
    echo "pressed a, shifting left"
    mosquitto_pub -h $HOST -t "miniwheels1/wheels" -m "800 0 1 800 1 0 $SPIN_DURATION"
elif [ "$input" = "s" ]; then
    echo "pressed s, going backward"
    mosquitto_pub -h $HOST -t "miniwheels1/wheels" -m "800 1 0 800 1 0 $DURATION"
elif [ "$input" = "d" ]; then
    echo "pressed d, shifting right"
    mosquitto_pub -h $HOST -t "miniwheels1/wheels" -m "800 1 0 800 0 1 $SPIN_DURATION"
fi
done
