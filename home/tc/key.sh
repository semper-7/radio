#!/bin/sh
N=1
E=`sed -n '$=' radio.lst`
let "E=$E+1"
echo -n $N>cmd.sed
echo -n p>>cmd.sed
while : ;do
F=`./in 889`
  if [ "$F" -eq "63" ]; then
  let "N=$N+1"
   if [ "$N" -eq "$E" ]; then
   N=1
   fi
  echo -n $N>cmd.sed
  echo -n p>>cmd.sed
  pkill mpg123
  sleep 1
  fi
usleep 30000
done
