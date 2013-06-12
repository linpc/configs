#!/bin/bash

im=`ibus engine`

if [ "${im}" = "chewing" ]; then
    ibus engine xkb:us::eng
else
    ibus engine chewing
fi
