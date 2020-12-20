#!/bin/sh
echo "Checking if tweego what is set:"
if [ -z "$TWEEGO_WATCH" ]; then
    echo "TWEEGO_WATCH is not set. Running normally."
    ./main /input -o /output/$TWEEGO_OUTFILE
else
    echo "TWEEGO_WATCH is set, starting tweego with watch."
    ./main /input -o /output/$TWEEGO_OUTFILE --watch
fi