#! /bin/bash
choise=yes
rchoise=yes
echo 'Программа определения наличия изменений в файле'
echo 'С помощью данной программы вы можете определить, изменялось ли содержимое 
файла после определенной даты'
echo 'Разработчик: Карх Елизавета '
while [ $choise = $rchoise ]; do
	#выведем имя текущего каталога
	echo 
	echo 'Имя текущего каталога:'
	pwd
	echo 
	#получаем имя файла для проверки
	echo 'Введите имя файла для проверки'
	read file
	#проверяем существование файла
	if [ ! -f $file ]; 
		then while [ ! -f $file ]; do
			echo 'Такого файла не существует.'
			echo 	
	     		echo 'Введите имя файла для проверки'
	     		read file
	     	done
	fi
	echo 
	#получаем дату, с которой будем сравнивать дату последних изменений
	echo 'Введите дату в формате: число месяц(номер месяца без 0) год:'
	echo '    (через пробелы, без знаков-разделителей)'
	read day month year
	echo 	
	#читаем дату последних изменений
	year1=`stat -c %z $file | tr ' ' '-' | cut -d'-' -f1`
        month1=`stat -c %z $file |  tr ' ' '-' | cut -d'-' -f2`
	day1=`stat -c %z $file |  tr ' ' '-' | cut -d'-' -f3`
	otv=0
	if [[ "$year" < "$year1" ]];
		then otv=1
	fi
	if [[ $year = $year1 ]];
		then 
		if [[ $month1 > $month ]];
		        	then otv=1
	 	elif [[ $month1 =  $month ]];
				then 
				if [[ $day1 > $day ]];
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
	else exit 250
fi
