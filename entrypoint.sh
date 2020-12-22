#!/bin/sh
echo "Starting Tweego, output to file $TWEEGO_FILE with options: $TWEEGO_PARAMETERS $@"
tweego -o /output/$TWEEGO_FILE /input $TWEEGO_PARAMETERS "$@"
echo "Tweego is finished running sucessfully."