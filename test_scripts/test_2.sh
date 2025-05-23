#!/bin/bash

#Проверка на наличие параметров(Кавычки нужны и важны)
if [ -n "$1" ]
then
if [ -n "$2" ]
then
echo "Параметры существуют"
fi
elif ! [ -n "$1" ]
then
echo "Первого параметра нет"
elif ! [ -n "$2" ]
then
echo "Второго параметра нет"
fi

#Параметры вводить через пробелы сразу после имени скрипта
echo "Первый " $1
echo "Второй " $2
echo "Третий" $3
#Сдвигает значение параметров на одно влево(значение 1 параметра теряется)
shift
sum=$[ $1+$2 ]
echo "Sum двух чисел равна" $sum

#Это команда $#
echo "Всего параметров $#"

#Команда $* и $@ - различия
for i in "$*"
do
echo "Так работает \$*: $i"
done

for j in "$@"
do
echo "Так работает \$@: $j"
done

#Ключи командной строки
while [ -n "$1" ]
do
case "$1" in
-a) echo "This is a";;
-b) echo "This is b";;
-c) echo "This is c";;
--) break;;
*) echo "$1 no here";;
esac
shift
done


#Чтение переменных, задаются пользователем без перевода на следующую строчку
echo -n "Введи что-то:"
read per_1
echo $per_1

#Чтение переменной скрывая текст
read -s -p "Введите пароль для дальнейшего прохождения: " password
echo
read -s -p "Повторите введенный пароль: " repeat_password
if [ $password = $repeat_password ]
then
echo "Успешно!"
else
echo "Не успешно! ЛОХ!"
fi

#Чтение из файла с другим разделителем
IFS="\n"
for i in $(cat "Mishanya]")
do
echo $i
done

#Чтение даннхы по строчке
count_2=1
cat Mishanya] | while read line
do
echo "Строчка $count_2"
echo $line
count_2=$[ $count_2+1 ]
done
