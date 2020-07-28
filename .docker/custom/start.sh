#! /bin/bash

cd /in
NUMFILES=$(ls -R *.mp4 | wc -l)
NUM=1
for i in $(find . -name *.mp4 -type f -print0 | xargs -0)
do
    echo "Processing ($NUM/$NUMFILES) $i"
    #HandBrakeCLI --preset-import-file /settings/preset.json -i "$i" -o "/out/${i%%.*}.mp4"
    mkdir -p /out/$(dirname $i)
    HandBrakeCLI --preset-import-file /settings/preset.json -i "$i" -o "/out/${i%.*}.mp4"
    ((NUM++))
done

echo "Handbrake Processing of Videos completed"

echo "Fixing Permissions..."
cd /out
chown -R 1000:1000 .
echo "All permissions fixed"

echo "Handbrake Batch encoding completed
