#!/bin/bash

# This software was made by BrebisSolide. 
clear
echo "current working directory : $PWD"
if [[ -f "dayz-launcher.sh" ]]; 
then
	echo "dayz CLI launcher detected."
else
	echo dayz-launcher.sh  not detected in working directory ! FATAL ERROR.
	exit 0
fi

echo Many thanks to bastimeyer for making his amazing CLI linux launcher for dayZ.
echo ""
echo Welcome to bashdayz linux client.
sudo sysctl -w vm.max_map_count=1048576 # Prevents the game from crashing while loading.
echo
echo You will be required to follow the steps in order to connect to a dayZ server.
echo ""
startgame()
{
	./dayz-launcher.sh   --debug   --server $1   --port $2   --launch   --name my
}
dial2()
{
	clear
	echo Saved servers - Select an option :
	#TODO Show list of all saved servers here.
	cat bashdayzserver
	file=$(cat bashdayzserver)
	mapfile -t saved <bashdayzserver
	read -p " " selection
	((val=$selection-1))
	current=${saved[$val]}
	IFS=';' read -ra  IP <<< "$current"
	echo "Attempting to connect to $current..."
	startgame ${IP[1]} ${IP[2]}


}
dial3()
{
	clear
	echo Add a new server :
	echo ""
	if [[ -f "bashdayzservers" ]]; then
		echo OK.
	else
		touch bashdayzserver
	fi
	read -p "Please enter a name for the new server : " newname
	echo $newname
	echo Done. Next, you will need to provide the server details.
	echo you can get them on: https://www.battlemetrics.com/servers/dayz .
	echo ""
	read -p "Please provide the server IP and GAME port : x.x.x.x:XXXX " ipgameport
	echo $ipgameport
	read -p "Please provide the server QUARRY port : XXXXX " quarry
	conc="$newname;$ipgameport;$quarry"
	echo $conc >> bashdayzserver
	echo "Done.  $newname  has been added to the serverlist. "
	dial1


}
dial4()
{
	clear
	echo Direct connect.
	echo ""
	echo Provide server IP, GAME port and QUARRY port :
	read -p " IP:GAMEPORT : " ipgame
	read -p " QUARRYPORT : " quarry
	echo "attempting to connect to $ipgame $quarry..."
	echo ""
	startgame $ipgame $quarry
}
dial5()
{
	clear
	read -p "Enter the in-game name you want to use : " pname
	echo $pname >> bashdayz
}
dial1()
{
	clear
	echo Select an option :
	echo ""
	echo " 1 - Show saved servers."
	echo " 2 - Add a new server."
	echo " 3 - Direct connect."
	#echo " ENTER - Join last server."
	echo
	
	read -p " " selecA
	case $selecA in
	1)
	dial2;;
	2)
	dial3;;
	3)
	dial4;;
	4)
	dial5;;
	"")
	echo "ENTER !";;
	*)
	echo "Please enter a valid option...";;
	esac
	#TODO Add join last server feature :-)

}

read -p "Please press ENTER to continue." var
if [$var -eq ""]; then
	clear
	dial1
fi
