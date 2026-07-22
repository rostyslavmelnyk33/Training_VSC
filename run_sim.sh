#!/bin/bash

# 1. Знаходимо файли у поточній папці
DESIGN_FILE=$(find . -maxdepth 1 -name "*.sv" ! -name "tb_*.sv" | head -n 1)
TB_FILE=$(find . -maxdepth 1 -name "tb_*.sv" | head -n 1)

if [ -z "$DESIGN_FILE" ]; then
    echo "❌ Не знайдено design-файлу (*.sv)"
    exit 1
fi

if [ -z "$TB_FILE" ]; then
    echo "❌ Не знайдено testbench-файлу (tb_*.sv)"
    exit 1
fi

# 2. Шукаємо назву top-модуля
TOP_MODULE=$(grep -E '^[[:space:]]*module[[:space:]]+' "$TB_FILE" \
    | head -n 1 \
    | sed -E 's/^[[:space:]]*module[[:space:]]+([A-Za-z_][A-Za-z0-9_]*).*/\1/')

if [ -z "$TOP_MODULE" ]; then
    echo "❌ Не вдалося знайти назву модуля у $TB_FILE"
    exit 1
fi

echo "🚀 Компіляція: $DESIGN_FILE + $TB_FILE (Top: $TOP_MODULE)..."

# 3. Запускаємо Verilator
verilator --binary --trace --timing --top-module "$TOP_MODULE" "$TB_FILE" "$DESIGN_FILE"

# 4. Перевіряємо та запускаємо
if [ $? -eq 0 ]; then
    echo "✅ Успішно! Запуск симуляції..."
    echo "----------------------------------------"
    ./obj_dir/V${TOP_MODULE}
    echo "----------------------------------------"
else
    echo "❌ Помилка компіляції Verilator!"
    exit 1
fi
