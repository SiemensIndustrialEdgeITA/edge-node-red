#!/bin/sh
NODERED_FOLDER=/data
NODERED_SETTINGS=settings.js
NODERED_DEFAULTFLOWS=flows.json

# COPY MODIFIED NODE RED SETTINGS FILE
cp $NODERED_SETTINGS $NODERED_FOLDER/$NODERED_SETTINGS
echo "Custom settings copied."

# COPY DEFAULT FLOWS FILE
cp $NODERED_DEFAULTFLOWS $NODERED_FOLDER/$NODERED_DEFAULTFLOWS
echo "Custom flows copied."

# START NODE APP
# IF NODE-RED WILL CRASH IT WILL START IN SAFE MODE
echo "Starting NodeRED App..."
npm start --cache $NODERED_FOLDER/.npm -- --userDir $NODERED_FOLDER || echo "### NODERED STOPPED WITH ERRORS! ### RESTARTING IN SAFE MODE ###" && npm start --safe --cache $NODERED_FOLDER/.npm -- --userDir $NODERED_FOLDER