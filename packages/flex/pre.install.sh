#!/bin/bash
sed -i "/math.h/a #include <malloc.h>" src/flexdef.h
