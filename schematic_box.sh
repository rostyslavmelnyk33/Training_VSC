#!/bin/bash

# 1. Знаходимо design-файл
TOP_FILE=$(find . -maxdepth 1 -name "*.sv" ! -name "tb_*.sv" | head -n 1)

if [ -z "$TOP_FILE" ]; then
    echo "❌ Не знайдено design-файлу (*.sv)"
    exit 1
fi

BASE=$(basename "$TOP_FILE" .sv)

# 2. Використовуємо Python для витягування портів та створення обгортки
python3 -c "
import re
with open('$TOP_FILE', 'r') as f: text = f.read()

# Шукаємо назву модуля та вміст його дужок (порти)
match = re.search(r'module\s+([A-Za-z0-9_]+)[^;]*?\((.*?)\)\s*;', text, re.DOTALL)
if match:
    mod_name = match.group(1)
    ports = match.group(2)
    # Створюємо обгортку, .* автоматично з'єднає порти!
    wrapper = f'module wrapper({ports});\n    {mod_name} dut(.*);\nendmodule'
    with open('temp_wrapper.sv', 'w') as out: 
        out.write(wrapper)
else:
    print('❌ Не вдалося розпарсити модуль')
    exit(1)
"

if [ ! -f "temp_wrapper.sv" ]; then
    exit 1
fi

echo "🎨 Малюємо чорну коробку для $BASE..."

# 3. Віддаємо все Yosys та NetlistSVG
yosys -p "read_verilog -sv $TOP_FILE temp_wrapper.sv; hierarchy -top wrapper; proc; write_json ${BASE}_box.json" -q
netlistsvg "${BASE}_box.json" -o "${BASE}_box.svg"
open "${BASE}_box.svg"

# 4. Прибираємо за собою
rm temp_wrapper.sv "${BASE}_box.json"
echo "✅ Готово!"
