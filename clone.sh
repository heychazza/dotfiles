#!/bin/sh

echo "Cloning repositories..."

DEV=$HOME/Documents/Development
SITES=$DEV/Sites
CODE=$DEV/Code

# Work
git clone git@github.com:track/app.analyse.net.git $SITES/analytics.tebex.io
git clone git@github.com:tebexio/Tebex-Minecraft.git $CODE/Tebex
