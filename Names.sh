#!/bin/bash

function to_lowercase {
    echo "$1" | tr '[:upper:]' '[:lower:]'
}

function calculate_string_weight {
    local str=$(to_lowercase "$1")
    echo "$str"  # Выводим строку для отладки/проверки
    
    local sum=0
    for ((j=0; j<${#str}; j++)); do
        let sum+=$(($(printf "%d" "'${str:$j:1}")-96))
    done
    let sum+=${#str}
    return $sum
}

# Пример использования:
names=(Tom Masha Sveta Vitek)
for name in "${names[@]}"; do
    calculate_string_weight "$name"
    score=$?
    echo "Name: $name, Score: $score"
done
