#!/bin/bash

clear

start () {

sleep 1

net1="ethernet"
net2="wlan"
wlan="wlan0"
eth="eth0"

bar () {
	bar='####################'
	echo ""
	for i in {0..20}; do
    		echo -ne "\r\e[31m[ Loading . . . ]\e[m ${bar:0:$i}"
    		sleep .05                
	done
	echo ""
	sleep .05
	echo -e "[ \e[31mLoading Complete\e[m  ]"
	sleep .2
}

cat << Kreative
			       |======================================================|
			       |░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░|
			       |░░░░░░░░░░░░░░░░░░░░░░░░██████░░░░░░░░░░░░░░░░░░░░░░░░|
			       |░░░░░░░░░░░░░░░░░░░██████░░░░█████░░░░░░░░░░░░░░░░░░░░|
			       |░░░░░░░░░░░░░░░█████░░░░░░░░░░░░░██████░░░░░░░░░░░░░░░|
			       |░░░░░░░░░░░█████░░░░░░░░░░░░░░░░░░░░░░█████░░░░░░░░░░░|
			       |░░░░░░░░░███░░░░░░░░░░░███████░░░░░░░░░░░░███░░░░░░░░░|
			       |░░░░░░░░░░░░░░░░░░░█████░░░░░█████░░░░░░░░░░░░░░░░░░░░|
			       |░░░░░░░░░░░░░░░░████░░░░░░░░░░░░░█████░░░░░░░░░░░░░░░░|
			       |░░░░░░░░░░░░░░███░░░░░░░░░░░░░░░░░░░░███░░░░░░░░░░░░░░|
			       |░░░░░░░░░░░░░░░░░░░░░░░░█████░░░░░░░░░░░░░░░░░░░░░░░░░|
			       |░░░░░░░░░░░░░░░░░░░░░████░░░████░░░░░░░░░░░░░░░░░░░░░░|
			       |░░░░░░░░░░░░░░░░░░░░██░░░░░░░░░██░░░░░░░░░░░░░░░░░░░░░|
			       |░░░░░░░░░░░░░░╔═════════════════════════╗░░░░░░░░░░░░░|
			       |░░░░░░░░░░░░░░║╔═╗║╔══╩╗╔╗║║╚╗║║╔══╣╔╗╔╗║░░░░░░░░░░░░░|
			       |░░░░░░░░░░░░░░║╚═╝║╚══╗║║║║╔╗╚╝║╚══╬╝║║╚║░░░░░░░░░░░░░|
			       |░░░░░░░░░░░░░░║╔╗╔╣╔══╝║║║║║╚╗║║╔══╝░║║░║░░░░░░░░░░░░░|
			       |░░░░░░░░░░░░░░║║║╚╣╚══╦╝╚╝║║░║║║╚══╗░║║░║░░░░░░░░░░░░░|
			       |░░░░░░░░░░░░░░╚═════════════════════════╝░░░░░░░░░░░░░|
			       |░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░|
			       |======================================================| [ V#: 1.0 ]
			       [ 	Welcome to REDNET v1.0 Made by xJinXx. 	      ]
			       |------------------------------------------------------|
			       [	     Copyright Protected : ©2023	      ]
			       |------------------------------------------------------|
			       
Kreative
echo -e "[ \e[31mREDNET\e[m ] : Welcome to REDNET"
sleep .5
echo -e "[ \e[31mREDNET\e[m ] : Heres your options.\n"
sleep 1
cat opt/opt.txt
echo -e "[ \e[31mREDNET\e[m ] : What will you choose?\n"
read rpn
if [ "$rpn" -eq "1" ]
then
	mac-spoof () {
	interfc=('wlan0', 'eth0')
	echo -e "[ \e[31mREDNET\e[m ] : You'd like to change your Mac-Addr ?"
	echo ""
	read -p "yes/no:   " anw
	sleep 1
	if [ $anw == "yes" ]
	then
		echo ""
		echo -e "[ \e[31mREDNET\e[m ] : Enter interface name. . . "
		echo ""
		read intt
		sleep 1
		if [ "$intt" == "$interfc" ] 
		then
			ifconfig $intt down
			echo ""
			sleep .5
			echo -e "\e[31m[ NETWORK=$intt STATE=\e[31mDown\e[m* ]"
			echo ""
			sleep .5
			ip r
			echo ""
			sleep 1
			echo -e "[ \e[31mREDNET\e[m ] : \e[31m[ * Changing Mac-Addr * ]\e[m"
			bar && macchanger -A $intt
			sleep 1
			ifconfig $intt up
			echo ""
			sleep .5
			echo -e "[ \e[31mREDNET\e[m ] : [ NETWORK=$intt STATE=\e[31mUP\e[m* ]"
			echo ""
			sleep .5
			echo -e "[ \e[31mREDNET\e[m ] : Mac-Addr has been SP00F3D!"
			sleep .5
		else
			echo ""
			echo -e "[ \e[31mREDNET\e[m ] : Invalid interface name"
			sleep .5
			clear
			mac-spoof
		fi
	else
		echo "GoodBye-->"
		sleep 1
		start
	fi	
	}
	mac-spoof
		
elif [ "$rpn" -eq "2" ]
then
	show-ip () {
	echo -e "[ \e[31mREDNET\e[m ] : You on ethernet or wlan?\n"
	read rpn2
	if [ "$rpn2" == "$net1" ]
	then
		bar
		ip addr | grep eth0
		sleep 1
		start
	
	elif [ "$rpn2" == "$net2" ]
	then
		bar
		ip addr | grep wlan0
		sleep 1
		start
	
	else
		echo -e "[ \e[31mREDNET\e[m ] : Not a valid choice.\n"
		sleep .5
		show-ip
	fi
	}
	show-ip
elif [ "$rpn" -eq "3" ]
then
	ip-lock () {
	echo -e "[ \e[31mREDNET\e[m ] : Enter IP -  \n"
	read ip1
	echo -e "[ \e[31mREDNET\e[m ] : Enter PORT -  \n"
	read prt
	echo -e "[ \e[31mREDNET\e[m ] : Validating IP . . .\n"
	sleep .5
	
	read valid <<< $( awk -v ip="$ip1" '
		BEGIN { n=split(ip, i,"."); e = 0;
		if (6 < length(ip) && length(ip) < 16 && n == 4 && i[4] > 0 && i[1] > 0){
			for(z in i){if (i[z] !~ /[0-9]{1,3}/ || i[z] > 256){e=1;break;}}
		} else { e=1; } print(e);}')

		if [ $valid == 0 ]; then
			echo -e "[ \e[31mREDNET\e[m ] : Success: IP Valid\n"
			sleep .5
			echo -e "[ \e[31mREDNET\e[m ] : Accessing Netwrok.\n"
			sleep .5
			echo -e "[ \e[31mREDNET\e[m ] : Network Connected.\n"
			sleep .5
			echo -e "[ \e[31mREDNET\e[m ] : Sniffing . . . "
			echo ""
			sleep .5
			xterm -hold -e "nmap -v -sn $ip1/$prt; echo -e '\nData Collected from network\n'; date " &
			sleep .1
			xterm -hold -e "echo -e '\nCollecting Connected hosts . . .\n' ; sleep 1 ; nmap -v -sn $ip1/$prt | grep latency; echo -e '\n-------------------------------\n' ; sleep .5 ; echo -e '\nCollecting MAC-ADDRs\n' ; nmap -v -sn $ip1/$prt | grep MAC; echo -e '\nMac-Address Collected from network\n'; date " &
			sleep 1
			start
			
			
			
		else
  			echo -e "[ \e[31mREDNET\e[m ] : Fail: IP Invalid\n"
  			sleep 1
  			ip-lock
		fi
		}
		ip-lock
	
	

elif [ "$rpn" -eq "4" ]
then
	capture () {
	echo -e "[ \e[31mREDNET\e[m ] : You on ethernet or wlan?\n"
	read rpn3
	if [ "$rpn3" == "$net1" ]
	then
		echo -e "[ \e[31mREDNET\e[m ] : Capturing Traffic. . ."
		sleep 1
		xterm -hold -e "tcpdump -v --interface=$eth" 
		start
		
	elif [ "$rpn3" == "$net2" ]
	then
		echo -e "[ \e[31mREDNET\e[m ] : Capturing Traffic. . ."
		sleep 1
		xterm -hold -e "tcpdump -v --interface=$wlan"
		start
	else
		echo -e "[ \e[31mREDNET\e[m ] : Not a valid choice.\n"
		sleep .5
		capture
		
	fi
	}
	capture
	
elif [ "$rpn" -eq "5" ]
then
		
	python3 py_contrib/port_scan.py
	sleep 1
	start

else
	echo -e "Not a valid choice. Try again."
	sleep 1
	start
fi
}
if [[ $(/usr/bin/id -u) -ne 0 ]]; then
    	sleep 1
   	echo -e "[ \e[31mREDNET\e[m ] : \nThis application must be ran as root to use some of its privilages. Try again with 'sudo'\n"
    	exit
else    
	start
fi
