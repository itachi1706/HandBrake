#! /bin/bash

cd /in
NUMFILES = $(ls *.mp4 | wc -l)
NUM=1
for i in *.mp4;
do
    echo "Processing ($NUM/$NUMFILES) $i"
    HandBrakeCLI --preset-import-file /settings/preset.json -i "$i" -o "/out/${i%%.*}.mp4"
    ((NUM++))
done

echo "Handbrake Processing of Videos completed"
