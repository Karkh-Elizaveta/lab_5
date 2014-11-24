#! /bin/bash
choise=yes
rchoise=yes
echo 'Программа определения наличия изменений в файле'
echo 'С помощью данной программы вы можете определить, изменялось ли содержимое 
файла после определенной даты'
echo 'Разработчик: Карх Елизавета '
while [ $choise = $rchoise ]; do
#выведем имя текущего каталога
echo ' '
echo 'Имя текущего каталога:'
pwd
echo ' '
#получаем имя файла для проверки
echo 'Введите имя файла для проверки'
read file
#проверяем существование файла
if [ ! -f $file ]; 
	then while [ ! -f $file ]; do
		echo 'Такого файла не существует'
		echo ' '	
	     	echo 'Введите имя файла для проверки'
	     	read file
	     done
fi
echo ' '
#получаем дату, с которой будем сравнивать дату последних изменений
echo 'Введите дату в формате: число месяц(номер месяца без 0) год:'
echo '    (через пробелы, без знаков-разделителей)'
read day month year
echo ' '
#читаем дату последних изменений
year1=`ls -l  $file | tr -s ' ' ' ' | cut -d' ' -f8`
#запоминаем длины двух переменных
dlina=${#year}
dlina1=${#year1}
#читаем нынешний год
realyear=`date | cut -d' ' -f6`
if [ $dlina1 !=  $dlina ];
        then year1=$realyear
fi
month11=`ls  -l $file | tr -s ' ' ' ' | cut -d' ' -f6`
#заменяем месяц последних изменений на его номер
case $month11 in
'Янв')
month1=1
;;
'Фев')
month1=2
;;
'Мар')
month1=3
;;
'Апр')
month1=4
;;
'Май')
month1=5
;;
'Июн')
month1=6
;;
'Июл')
month1=7
;;
'Авг')
month1=8
;;
'Сен')
month1=9
;;
'Окт')
month1=10
;;
'Ноя')
month1=11
;;
'Дек')
month1=12
;; 
esac
#продолжаем ввод даты
day1=`ls -l  $file | tr -s ' ' ' ' | cut -d' ' -f7`
otv=0
if [[ "$year" < "$year1" ]];
	then otv=1
fi
if [[ $year = $year1 ]];
	then if [[ "$month" < "$month1" ]];
	        	then otv=1
 	else if [[ "$day" < "$day1" ]];
			then otv=1
fi
fi
fi
ideal=1
if [ "$otv" !=  "$ideal" ];
	then 
		echo "Файл не изменялся после указанной даты"
	else 
		echo "Файл изменялся после указанной даты"
fi
echo ' '
echo 'Продолжить работу? (Введите yes или no)'
read choise
done
if [ "$otv" !=  "$ideal" ];
	then exit 120

