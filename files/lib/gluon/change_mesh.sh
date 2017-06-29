#!/bin/sh
meshSSID_prefix="d2:84:2a:f7"
host=`uname -n`
okt0=${host:0:2}
okt1=${host:2:1}"0"
suffix=$okt0":"$okt1
myIBSS=$(uci get wireless.ibss_radio0.bssid)
if [ `echo $suffix | egrep "^([0-9A-Fa-f]{2}:){1}[0-9A-Fa-f]{2}$"` ];
then
 # valide MAC
 newIBSS=$meshSSID_prefix":"$suffix
else
 # invalide MAC
 newIBSS=$meshSSID_prefix":0:0"
fi
if [ "$newIBSS" == "$myIBSS" ]; 
  then
    # we are good, nothing to do  
    exit 1 
fi
if [ $(batctl gwl | grep "=>" | grep -c mesh-vpn) -gt 0 ]; 
  then
    # Node has an uplink and switches its mesh
	uci set wireless.ibss_radio0.ssid=$newIBSS
	uci set wireless.ibss_radio0.bssid=$newIBSS
	wifi
  else
  if [ $(iw ibss0 scan | grep -c "$newIBSS") -gt 1 ];
    then
    # new mesh found
	uci set wireless.ibss_radio0.ssid=$newIBSS
	uci set wireless.ibss_radio0.bssid=$newIBSS
	wifi
  fi
fi