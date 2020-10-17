#!/bin/bash
sed -i -r 's:"(/desktop):"/org/gnome\1:' schema/*.xml
