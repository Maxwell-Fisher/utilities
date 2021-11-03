#Made by Maxwell Fisher - @Maxwellcrafter
#This script waits until a USB device is plugged in and/or removed, and then prints info about that device using lsusb

until lsusb > tmp1.txt && \
sleep 5 && \
lsusb > tmp2.txt && \
diff tmp1.txt tmp2.txt | tail -n +2 | cut -c 3- | grep -m 100 "Device"; \
do : ; done
rm tmp1.txt tmp2.txt
