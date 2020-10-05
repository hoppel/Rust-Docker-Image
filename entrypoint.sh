#! /bin/bash
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$(pwd)
cd /home/steam

if [ ! -z "$PATCH_ZIP" ]; then
    curl -sSL $PATCH_ZIP > /tmp/harmonyPatches.zip
    unzip -o -q /tmp/harmonyPatches.zip -d /home/steam/HarmonyMods
    rm /tmp/harmonyPatches.zip
    echo "Updated Harmony Patches"
fi

./RustDedicated $@
