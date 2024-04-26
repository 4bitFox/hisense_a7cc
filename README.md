# hisense_a7cc
Everything I figured out about messing with this device.

All the info regarding the A7CC is scattered troughout many forums and posts. I want to spare you the time by writing down the infos I found to be working.

> [!CAUTION]
> ### As always: MESSING WITH YOUR PHONE CAN BREAK IT, so be careful. I'm not responsible for anything. :-)



# BACKUP
> [!WARNING]
> Entering autodload aparrently [WIPES your splloader](https://github.com/TomKing062/CVE-2022-38694_unlock_bootloader/issues/6#issuecomment-1627545223)! By entering it you will be stuck in emergency download mode (Ask me how I found out :-D). Your phone will NOT boot normally, even with hardware key combos!!
```
adb reboot autodload
```

## Setting up spd-dump
I did this in Linux so I won't cover how to set up windows drivers. This part of the guide is Linux only for now!

spd-dump linux build: 
```
https://github.com/4bitFox/CVE-2022-38694_unlock_bootloader/releases
```

A7CC Files: 
Put the executeable and the other files together in the same folder.
```
https://github.com/TomKing062/CVE-2022-38694_unlock_bootloader/releases

In case the files are not around anymore in the above link:
https://github.com/4bitFox/CVE-2022-38694_unlock_bootloader/releases
```

## Running spd_dump:
> [!TIP]
> Depending on your distro you need to run: (lasts until reboot)
> ```
> sudo setenforce 0
> ```
> Depending how your groups and permissions are set up you need to add your user to the correct group. I was just lazy and ran spd_dump with sudo....


## spd_dump Commands:
### List Partitions:
```
./spd_dump exec_addr 0x3f28 fdl fdl1-dl.bin 0x5500 fdl uboot-mod.bin 0x9efffe00 exec partition_list partition.xml reset
```
This will output a file which looks like this:

Use your file as refrence in case stuff is different! I dunno tbh xD We can later use this info to back up partitions....
```
<Partitions>
    <Partition id="miscdata" size="5"/>
    <Partition id="misc" size="1"/>
    <Partition id="nr_fixnv1" size="8"/>
    <Partition id="nr_fixnv2" size="8"/>
    <Partition id="prodnv" size="10"/>
    <Partition id="nr_runtimenv1" size="10"/>
    <Partition id="nr_runtimenv2" size="10"/>
    <Partition id="recovery" size="40"/>
    <Partition id="trustos" size="6"/>
    <Partition id="trustos_bak" size="6"/>
    <Partition id="sml" size="1"/>
    <Partition id="sml_bak" size="1"/>
    <Partition id="uboot" size="1"/>
    <Partition id="uboot_bak" size="1"/>
    <Partition id="uboot_log" size="4"/>
    <Partition id="logo" size="7"/>
    <Partition id="fbootlogo" size="7"/>
    <Partition id="l_pmsys" size="1"/>
    <Partition id="l_agdsp" size="6"/>
    <Partition id="gnssmodem" size="1"/>
    <Partition id="wcnmodem" size="10"/>
    <Partition id="persist" size="2"/>
    <Partition id="nr_spl" size="1"/>
    <Partition id="nr_sml" size="1"/>
    <Partition id="nr_uboot" size="1"/>
    <Partition id="nr_boot" size="35"/>
    <Partition id="nr_pmsys" size="1"/>
    <Partition id="nr_agdsp" size="6"/>
    <Partition id="nr_modem" size="40"/>
    <Partition id="nr_v3phy" size="8"/>
    <Partition id="nr_nrphy" size="8"/>
    <Partition id="nr_nrdsp1" size="5"/>
    <Partition id="nr_nrdsp2" size="5"/>
    <Partition id="nr_deltanv" size="2"/>
    <Partition id="teecfg" size="1"/>
    <Partition id="teecfg_bak" size="1"/>
    <Partition id="boot" size="35"/>
    <Partition id="dtbo" size="8"/>
    <Partition id="flag" size="1"/>
    <Partition id="diag" size="1"/>
    <Partition id="tpf" size="8"/>
    <Partition id="phonelog" size="100"/>
    <Partition id="kdebuginfo" size="200"/>
    <Partition id="databackup" size="50"/>
    <Partition id="prospecfg" size="1"/>
    <Partition id="reserve" size="10"/>
    <Partition id="kdebug" size="10"/>
    <Partition id="super" size="9216"/>
    <Partition id="cache" size="256"/>
    <Partition id="socko" size="75"/>
    <Partition id="odmko" size="25"/>
    <Partition id="vbmeta" size="1"/>
    <Partition id="vbmeta_bak" size="1"/>
    <Partition id="metadata" size="16"/>
    <Partition id="sysdumpdb" size="10"/>
    <Partition id="vbmeta_system" size="1"/>
    <Partition id="vbmeta_vendor" size="1"/>
    <Partition id="userdata" size="0xffffffff"/>
</Partitions>
```


### Backup:
You decide what you need to back up.
```
*1 partition id
*2 offset (leave at zero unless you are gigabrain)
*3 size of partition
*4 output file name
                                                                                               *1  *2 *3  *4
./spd_dump exec_addr 0x3f28 fdl fdl1-dl.bin 0x5500 fdl uboot-mod.bin 0x9efffe00 exec read_part boot 0 35M boot.img reset
```
This example backs up the boot partition.
```
./spd_dump exec_addr 0x3f28 fdl fdl1-dl.bin 0x5500 fdl uboot-mod.bin 0x9efffe00 exec read_part boot 0 35M boot.img reset
```

### Exit autodload:
Here we flash splloader partition so the phone can boot again. Replace u-boot-spl-16k-sign.bin with your splloader in case you have a backup of it before you entered autodload which wiped it.
```
./spd_dump exec_addr 0x3f28 fdl fdl1-dl.bin 0x5500 fdl uboot-mod.bin 0x9efffe00 exec erase_part uboot_log write_part splloader u-boot-spl-16k-sign.bin timeout 100000 reset
```


# GSI
WIP together with @denzilferreira Huge thanks to him :-)
