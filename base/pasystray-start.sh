#!/bin/bash

killall -q pasystray

while pgrep -x pasystray >/dev/null; do sleep 1; done

pasystray 
