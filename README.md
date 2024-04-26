# hisense_a7cc
Everything I figured out about messing with this device.

All the info regarding the A7CC is scattered troughout many forums and posts. I want to spare you the time by writing down the infos I found to be working.

### As always: MESSING WITH YOUR PHONE CAN BREAK IT, so be careful. I'm not responsible for anything. :-)



# autodload and spd_dump
Entering autodload aparrently WIPES your splloader! By entering it you will be stuck in emergency download mode (Ask me how I found out :-D).
```
adb reboot autodload
```


List Partitions:
```
./spd_dump exec_addr 0x3f28 fdl fdl1-dl.bin 0x5500 fdl uboot-mod.bin 0x9efffe00 exec partition_list partition.xml reset
```

Backup Boot:
```
sudo ./spd_dump exec_addr 0x3f28 fdl fdl1-dl.bin 0x5500 fdl uboot-mod.bin 0x9efffe00 exec read_part boot 0 35M boot.img reset
```

Exit autodload:
```
sudo ./spd_dump exec_addr 0x3f28 fdl fdl1-dl.bin 0x5500 fdl uboot-mod.bin 0x9efffe00 exec erase_part uboot_log write_part splloader u-boot-spl-16k-sign.bin timeout 100000 reset
```
