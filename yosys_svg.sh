#!/bin/bash

TOP_FILE=$(find . -maxdepth 1 -name "*.sv" ! -name "tb_*.sv" | head -n 1)

if [ -z "$TOP_FILE" ]; then
    echo "❌ Не знайдено design-файлу (*.sv)"
    exit 1
fi

BASE=$(basename "$TOP_FILE" .sv)

TOP_MODULE=$(grep -E '^[[:space:]]*module[[:space:]]+' "$TOP_FILE" \
    | head -n 1 \
    | sed -E 's/^[[:space:]]*module[[:space:]]+([A-Za-z_][A-Za-z0-9_]*).*/\1/')

# Залишили hierarchy, але прибрали techmap для збереження RTL-структури
yosys -p "
read_verilog -sv $TOP_FILE;
hierarchy -top $TOP_MODULE;
proc;
opt;
write_json ${BASE}.json
"

netlistsvg "${BASE}.json" -o "${BASE}.svg"
open "${BASE}.svg"
