#!/bin/bash
action=$1
my_led_path=/sys/class/leds/mmc0\:\:/brightness
echo $action > $my_led_path
