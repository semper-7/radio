#!/bin/sh
echo "Setting IP"
ifconfig eth0 192.168.1.123 netmask 255.255.255.0
route add default gw 192.168.1.1 eth0
echo "nameserver 212.94.96.123" >> /etc/resolv.conf
echo "Start telnet server"
/usr/sbin/telnetd
echo "Start tftp server"
/sbin/udpsvd -E 0 69 /usr/sbin/tftpd -c /home/tc &
echo "Radio"
./key.sh&
amixer sset Master 31
amixer sset PCM 31
while : ; do
R=`sed -nf cmd.sed radio.lst`
mpg123 $R
sleep 1
done

