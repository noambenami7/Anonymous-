#!/bin/bash
function nba0() {
echo %%%%%%%%%%%%%%%%%%%%%%%%%%%%
}


function nba1() {
  if ! command -v nmap &>/dev/null; then
    sudo apt-get install nmap -qq -y > /dev/null 2>&1
  else
    echo  "[%] nmap is already installed."
  fi

}
function nba1() {
  if ! command -v geoiplookup &>/dev/null; then
    sudo apt-get install geoiplookup -qq -y > /dev/null 2>&1
  else
    echo  "[%] nmap is already installed."
  fi

function nba2() {
  if ! command -v nmap &>/dev/null; then
    sudo apt-get install nmap -qq -y > /dev/null 2>&1
  else
    echo "[%] geoiplookup is already installed."
  fi
}

function nba3() {
  if ! command -v sshpass &>/dev/null; then
    sudo apt-get install sshpass -qq -y > /dev/null 2>&1
  else
    echo  "[%] sshpass is already installed."
  fi
}


function nba4() {
 if ! command -v whois &>/dev/null; then
    sudo apt-get install whois -qq -y > /dev/null 2>&1
  else
     echo  "[%] whois is already installed."
 fi
 }



nba5() {
    if [ -z "$(sudo find / -name nipe 2>/dev/null)" ]; then
        git clone https://github.com/htrgouvea/nipe &>/dev/null 
        sudo cpanm --installdeps . &>/dev/null
        sudo perl nipe.pl install . &>/dev/null 
    else 
        echo  "[%] nipe is already installed."
    fi
     
}


function startnipe() {
    # Find nipe path and store it in a variable
    nipe_path=$(sudo find / -name nipe 2>/dev/null)

    if [ -n "$nipe_path" ]; then
        # Change directory to the nipe path
        cd "$nipe_path"
        
        sudo perl nipe.pl start

        sudo perl nipe.pl stop

        sudo perl nipe.pl restart

        sudo perl nipe.pl start
    else
        echo "nipe not found on the system."
    fi
}






function anony() {
    ip=$(curl -s ifconfig.me)
    
    read -p "[?] which IP you want to scan: " ip_target

    if [ "$(geoiplookup "$ip_target" 2>/dev/null | grep -i country | grep IL)" ]; then
        echo "You are not anonymous. Exiting..."
        exit
    else
        echo  "[!] You are anonymous."
    fi
}





function anony1 () {

ip=$(wget -qO- https://api64.ipify.org?format=json | awk -F'"' '{ print $4 }')
  
if [ "$( geoiplookup $ip | grep -i country | grep IL)" ]

then
   echo "there is no country"
else
   echo "[#] the counry name is" - spofed country  $( geoiplookup $ip | awk '{ print $4 , $5}' )
   fi
}



function rmt() {

	username="kali"
	password="kali123"
	ip="192.168.227.130"



  
sudo sshpass -p "$password" ssh -o StrictHostKeyChecking=no "$username"@"$ip" "echo 'uptime is:'; date ; echo  'the ip is:' ; /sbin/ifconfig | awk '/broadcast/ { print \$2 }' ; echo  'the country is:' ; curl -s ipinfo.io/country"




sudo sshpass -p "$password" ssh -o StrictHostKeyChecking=no "$username"@"$ip" "whois $ip_target"  >> "/home/kali/whois.data"

log.everything1

echo  "[#] whois data saved into whois.data"

sudo sshpass -p "$password" ssh -o StrictHostKeyChecking=no "$username"@"$ip" "nmap $ip_target" >> "/home/kali/nmap.data"

log.everything

echo  "[#] nmap data saved into nmap.data"

}

function log.everything() {

echo "$(date) - [@] nmap scan to... -  $ip_target" >> /home/kali/log.everything

}

function log.everything1() {

echo "$(date) - [@] whois scan to... -  $ip_target" >> /home/kali/log.everything

}




nba1
nba2
nba3
nba4
nba5
startnipe
anony
anony1
rmt
