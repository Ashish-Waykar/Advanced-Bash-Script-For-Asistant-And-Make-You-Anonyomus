#You can Download it's dependencies manually 
#Packages To Download festival,sox,sox libsox-fmt-all

if [ ! -d "/bashscript" ]
then

	mkdir -p bashscript
	cd bashscript
	touch  log_file.txt
	date >> log_file.txt

	if [ ! -f "Details.txt" ]
	then
		
echo -e "\e[1;36m"
echo "	 _______________________________________________________________________________________________"
echo -e "	| \e[1;32m  You Are Running These Code First Time You Need To Install Dependencies of These Program \e[1;36m    |"
echo -e "	| \e[1;32m      			Plese Provide Your System Password !                        \e[1;36m    |"
echo -e "	| \e[1;32m						OR    					 \e[1;36m	|"
echo -e "	| \e[1;32m 			      Log In As Root User ! to Proceed Further !		 \e[1;36m 	|"
echo " 	 -----------------------------------------------------------------------------------------------"
echo -e "\e[0m"
		sudo apt-get install festival
		sudo apt-get install sox
		sudo apt-get install sox libsox-fmt-all

		echo "Please Create Your Profile !"

		touch Details.txt
		echo "Details  File : " > Details.txt

		read -p "Enter Full Name    :  >>  " name
		echo  " Your Name           :  $name">>Details.txt

		read -p "Enter Your Age     :  >>  " age
		echo  " Your Age            :  $age">>Details.txt

		read -p "Enter Email        :  >>  " class
		echo  " Your Email          :  $class">> Details.txt

		read -p "Enter Phone Number :  >>  " phno
		echo  " Your Phone Number   :  $phno">> Details.txt

		read -p "Enter Address      :  >>  " add
		echo  " Your Address        :  $add">> Details.txt
	fi
	cd ..
else
echo ""
fi


main_ui () {
echo -e "\e[1;33m"
echo "  ==== === === === === === === === === === === ====="
echo " || 	 __________________________________        ||"
echo " ||	|  ID  |    Service Type           |       ||"
echo " ||	|++++++++++++++++++++++++++++++++++|       || "
echo -e " ||	| \e[1;32m 1 \e[0m \e[1;33m | \e[1;32m Play  Music ! \e[0m   \e[1;33m        |       ||"
echo " ||	|__________________________________|       ||"
echo -e " || 	| \e[1;32m 2 \e[0m \e[1;33m | \e[1;32m Open Text Editor ! \e[1;33m      |       ||"
echo " ||	|_________________________________ |       ||"
echo -e " ||	| \e[1;32m 3 \e[0m \e[1;33m | \e[1;32m Get My Profile Details ! \e[1;33m|       || "
echo " ||	|__________________________________|       ||"
echo -e " ||	| \e[1;32m 4 \e[0m \e[1;33m | \e[1;32m Show  Calender !   \e[1;33m      |       ||"
echo " ||	|__________________________________|       ||"
echo -e " ||	| \e[1;32m 5 \e[0m \e[1;33m | \e[1;32m Make Me Anonyomus ! \e[1;33m     |   	   ||"
echo " ||	|__________________________________|	   ||"
echo -e " ||	| \e[1;32m 6 \e[0m \e[1;33m | \e[1;32m About US           \e[1;33m      |       || "
echo " ||	|----------------------------------|       || "
echo -e " ||	| \e[1;32m 7 \e[0m \e[1;33m | \e[1;32m EXIT  	    \e[1;33m       |       || "
echo " ||	 ----------------------------------        || "
echo " || 	    				 	   ||"
echo "  ==== === === === === === === === === === === ====="
echo -e "\e[0m"
#echo "Here , Is The List What I Can Do For You ! "| festival --tts
#echo "Please Go Through it And refffer me the index number of  your Service" | festival --tts

}

z=0
while [ $z == 0 ] 
do
main_ui

read -p "    Service ID : "  service

case $service in 
1)
echo -e "\e[1;36m"
echo "	 _________________________________"
echo "	|    Welcome ! In Music Player    |"
echo " 	 ---------------------------------"
echo -e "\e[0m"
echo -e "\e[1;33m	 Change Music Please Press CTR + C \e[0m"
echo ""
echo ""
cd Music
solst=$(ls)
cd ..

cd bashscript
touch songs_list.txt
echo "$solst">songs_list.txt
file='songs_list.txt'
i=1
while read line;do
#echo "line no $i : $line "
cd ..
#code to play song 
	cd Music
	echo -e "\e[1;32m	|| Playing Song : \e[1;35m $line \e[0m \e[1;32m || \e[0m"
	play $line

i=$((i+1))
done<$file

cd ..

;;
2)

echo "your choice is Open The Text Editor !"
read -p "Type Your New Filename Here : " filename 
file=$filename.txt


echo "" 
echo "Here is your Directory files !"
ls
echo ""
echo ""

read -p "$filename >>  " text
echo  " $text">> $filename.txt
read -p "Do You Won't To See the Content Insite the file ? (y/n)" read_file
	case $read_file  in 
	'y')
	echo ""
	echo ""
	echo "Here is your File  Content "
	echo""
	cat $filename.txt
	;;
	'n')
	echo ""
	echo ""
	echo "You choosed N Option !"

	;;
	*)
	echo "This is an Un Known Command For me Please Provide me (y/n) "
	esac
;;
3)
echo -e "\e[1;36m"
echo "	 _________________________________"
echo "	|      Your Profile Details       |"
echo " 	 ---------------------------------"
echo -e "\e[0m"

cd bashscript
if [ -f "Details.txt" ]
then
	echo""
	echo""
	echo "		Here is your Details   "
	echo""
	cat Details.txt

else

	echo ""
	echo ""
	echo "Here is your Profile Details "
	echo""
	cat Details.txt
cd ..
fi
echo -e "\e[0:32m Press Any Key To Continue ...\e[0m"
read G
;;
4)
echo -e "\e[1;36m"
echo "	 _________________________________"
echo "	|         Show Calender           |"
echo " 	 ---------------------------------"
echo -e "\e[0m"

echo -e "\e[1;32m"

echo  "please sir Provide Me A Which year Of Calender Do You Won't to see Now ? "
echo -e "\e[0m"
echo -e "\e[1;33m" 
read -p "Year Please :  " year
echo -e "\e[0m"
echo -e "\e[1;32m"
cal $year
echo -e "\e[0m"

echo -e "\e[0:32m Press Any Key To Continue ...\e[0m"
read G

;;
5)
echo -e "\e[0;33m Note : This Will Work Only If You Are Logged in As A root user in system ! \e[0m "
echo ""
echo ""
echo -e "\e[0;32m Your Choice Is Make Me Anonyomus ! \e[0m"
echo ""
echo "This Command Will Go to Change Your System MAC Address !"
echo "Check Your Interface MAC Address Before And After Compleate Process ! "
echo "You can Check It By Fireing Simple 'ifconfig' Command On Your Terminal !"
echo ""
echo "Please Provide Me Interface Of Your System That Is Connected To Network !"
echo "Interface == eth0 , wan0 , wan1 ... etc."
echo ""
read -p "Enter Interface Here : " interface
echo ""
echo "Please Provide Me New MAC That You Won't To Assign To your System !"
echo "it is 12 digit no. seperated by ':' For ex. 00:00:00:00:00:00  "
echo ""
read -p "Enter New MAC Here   : " MAC 
ifconfig  $interface down
ifconfig $interface hw ether $MAC


echo ""

echo ""
echo "Please Provide Me New IP Address That You Won't To Assign To your System !"
echo ""
read -p "Enter New IP Here   : " IP 
echo "Please Enter Yout Interface Netmask Also"
read -p "Enter Mask Here     : " Mask
ifconfig $interface $IP netmask $Mask
ifconfig $interface up



echo -e "\e[0:32m Press Any Key To Continue ...\e[0m"
read G



;;

6)
echo -e "\e[1;33m"

echo "		     __________________________________________"
echo "		    ||             { About Us }               ||"
echo "		    ||  { Direct Second Year Micro Project }  ||"
echo "		    ||        Linux Operating System          ||"
echo "		     ------------------------------------------"
echo ""
echo " 		 ==== === === === === === === === === === === ===="
echo " 		|| 	 ________________________________         ||"
echo " 		||	|  Roll No   | Student Name      |        ||"
echo " 		||	++++++++++++++++++++++++++++++++++        ||"
echo " 		||	|  18CM048   | Yash Ramteke      |        ||"
echo " 		||	 ________________________________         ||"
echo " 		|| 	|  19CM202   | Ekta Dandge       |        ||"
echo " 		||	_________________________________         ||"
echo " 		||	|  19CM203   | Vaishnavi Pande   |        ||"
echo " 		||	 ________________________________         ||"
echo " 		||	|  19CM205   | Ashish Waykar     |        ||"
echo " 		||	 ________________________________         ||"
echo " 		||			                          ||"
echo " 		||	 ----------------------------------       ||"
echo " 		||	|      This Code Is Created By ,   |      ||"
echo " 		||	|         Ashish Anil Waykar       |      ||"
echo " 		||	 ----------------------------------       ||"
echo " 		|| 	    				          ||"
echo " 		 ==== === === === === === === === === === === ===="
echo ""
echo -e "\e[0m"
echo -e "\e[1;32m"

echo "		   ^___________________________________________^"
echo "		   | Ashish Anil Waykar Developed Me For You ! |"
echo "		   |===========================================|"

echo "Ashish Anil Waykar Developed Me For You ! "|festival --tts
echo -e "\e[0m"

echo -e "\e[1:32m Press Any Key To Continue ...\e[0m"
read G
;;
7)
echo " Thank You Sir For Chosing Me As Your Asistant! "|festival --tts
echo " Thank You Sir For Chosing Me As Your Asistant! "

echo " That's all From My Side And I Hope You Would  Like My Service !..."| festival --tts 
echo " That's all From My Side And I Hope You Would  Like My Service !..."
((z++))
if [[ $z != 0 ]]; then
break
fi



esac

echo
 

done
