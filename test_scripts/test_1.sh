#!/bin/bash

#Проверка на владельца файла(сравнивается с текущим)
if [ -O test_1.sh ]
then
echo "It is OK"
else
echo "Not OK"
fi

#Назначение переменным функции команд двумя способами
com_1=`ls -l`
echo $com_1
com_2=$(pwd)
echo $com_2

#Математические операции
value_1=$((25*2))
value_2=$(($value_1+2))
echo $value_2

#Конструкции if-then-elif-then-else + сравнение чисел:
number_1=2
number_2=12
if [ $number_2 -gt $number_1 ]
then
echo "Number 2 more, than number 1"
elif (($number_2 -lt $number_1))
then
echo "Number 1 more, than number 2"
else
echo "Number 1 equal number 2"
fi


#У сравнения строк прописная буква меньше чем строчная
str_1="k"
str_2="K"
str_3=""

#Проверка строки на пустоту
if [ -z $str_3 ]
then
echo "str 3 is NULL"
else
echo "str 3 is not NULL"
fi

#Сравнение строк(обязательный обратный слэш(\))
if [ $str_1 \> $str_2 ]
then
echo "str 1 more than str 2"
elif [ $str_1 \< $str_2 ]
then
echo "str 1 less than str 2"
else
echo "str 1 equal str 2"
fi

#Проверка файлов
#Объявление файлов/пути к файлу/директории должно быть в кавычках
file_1="my_scripts_bash"
if [ -d $file_1 ]
then
echo "Файл существует и это директория"
elif [ -e $file_1 ]
then
echo "Файл существует и это не директория"
else
echo "Файла не существует"
fi

#Цикл FOR
for i in 1 2 3 4 5
do
echo "Создание $i-ого файла"
touch file_$i
done

#Другой вариант
for (( i=1; i<=5; i++ ))
do
echo "Удаление $i-ых файлов"
rm file_$i
done

path="/home/kali/*"
for i in $path
do
if [ -d $i ]
then
echo "$i директория"
elif [ -f $i ]
then
echo "$i файл"
fi
done

#Цикл WHILE
i=0
while [ $i -lt 5 ]
do
i=$[ $i+1 ]
echo "$i раз создали"
touch file_$i
done > Mishanya]

#Демонстрация break
i=1
while [ $i -lt 10 ]
do
if ! [ -f file_$i ]
then
break
else
echo "$i раз удалили"
rm file_$i
i=$[ $i+1 ]
fi
done >> Mishanya]
