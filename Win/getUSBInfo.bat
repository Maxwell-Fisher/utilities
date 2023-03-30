::Made by Maxwell Fisher - @Maxwellcrafter
::This script waits until a USB device is plugged in and/or removed, and then prints info about that device

@pnputil /enum-devices /connected /class USB > "%tmp%\usbtmp1"
:checkLoop
@ping 127.1 -n 2 > nul
@pnputil /enum-devices /connected /class USB > "%tmp%\usbtmp2"
@fc /LB1000 "%tmp%\usbtmp1" "%tmp%\usbtmp2" > nul && goto checkLoop
@findstr /bevg:"%tmp%\usbtmp1" "%tmp%\usbtmp2" | findstr ":"
@findstr /bevg:"%tmp%\usbtmp2" "%tmp%\usbtmp1" | findstr ":"
@del "%tmp%\usbtmp1"
@del "%tmp%\usbtmp2"
@echo.

