#bin/sh

file="/opt/ivre/ivre-linecount.txt"
line=$(cat "$file")

echo $line
sudo tail -n +$line /opt/ivre/iplist1.log | grep -o '[0-9]\{1,3\}\.[0-9]\{1,3\}\.[0-9]\{1,3\}\.[0-9]\{1,3\}' | sort | uniq >> /opt/ivre/iplist.log
wait

#Scan
cd /opt/ivre
proxychains /opt/ivre/bin/ivre runscans --file /opt/ivre/iplist.log --output=XMLFork
wait

# Update Line Number
sudo rm /opt/ivre/ivre-linecount.txt
wait

sudo grep -o '[0-9]\{1,3\}\.[0-9]\{1,3\}\.[0-9]\{1,3\}\.[0-9]\{1,3\}' /opt/ivre/iplist1.log | wc -l >> /opt/ivre/ivre-linecount.txt
wait

