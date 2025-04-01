NUM_PHILOSOPHERS=5
declare -a forks
for ((i=0; i<NUM_PHILOSOPHERS; i++)); do
    forks[i]=1 # 1 означает, что вилка свободна
done

function eat {
    philosopher_id=$1
    left_fork=$philosopher_id
    right_fork=$(( (philosopher_id + 1) % NUM_PHILOSOPHERS ))

    while true; do
        echo "Философ $philosopher_id размышляет."
        sleep 1 # Имитация времени размышлений

        # Берем вилки
        if [[ $left_fork -lt $right_fork ]]; then
            while [[ ${forks[left_fork]} -eq 0 || ${forks[right_fork]} -eq 0 ]]; do
                sleep 0.1 # Ожидание, если вилка занята
            done
            forks[left_fork]=0 # Захватываем левую вилку
            forks[right_fork]=0 # Захватываем правую вилку
        else
            while [[ ${forks[right_fork]} -eq 0 || ${forks[left_fork]} -eq 0 ]]; do
                sleep 0.1 # Ожидание, если вилка занята
            done
            forks[right_fork]=0 # Захватываем правую вилку
            forks[left_fork]=0 # Захватываем левую вилку
        fi

        echo "Философ $philosopher_id ест."
        sleep 1 # Имитация времени еды

        # Освобождаем вилки
        forks[left_fork]=1 # Освобождаем левую вилку
        forks[right_fork]=1 # Освобождаем правую вилку

        echo "Философ $philosopher_id закончил есть."
    done
}

# Запускаем философов в фоновом режиме
for ((i=0; i<NUM_PHILOSOPHERS; i++)); do
    eat $i &
done

# Ожидаем завершения всех философов (это никогда не произойдет)
wait

echo "Все философы закончили."
