# hisense_a7cc
Everything I figured out about messing with this device.

All the info regarding the A7CC is scattered troughout many forums and posts. I want to spare you the time by writing down the infos I found to be working.

> [!CAUTION]
> ### As always: MESSING WITH YOUR PHONE CAN BREAK IT, so be careful. I'm not responsible for anything. :-)
> ### I bought my phone with bootloader already unlocked and verification disabled. Some stuff here requires this to be done!! As I didn't unlock myself, I will not cover this here for now.

This stuff is not listed in order. Just search for what you need here :-)

- [Developer Settings](https://github.com/4bitFox/hisense_a7cc/blob/main/README.md#developer-options)
- [Recovery + Wipe user data](https://github.com/4bitFox/hisense_a7cc/blob/main/README.md#recovery--wipe-user-data)
- [Restore to stock rom](https://github.com/4bitFox/hisense_a7cc/blob/main/README.md#restore-to-stock-rom)
- [Fastboot](https://github.com/4bitFox/hisense_a7cc/blob/main/README.md#fastboot)
- [BACKUP Partitions](https://github.com/4bitFox/hisense_a7cc/blob/main/README.md#backup-partitions)
- [Patch boot.img with Magisk](https://github.com/4bitFox/hisense_a7cc/blob/main/README.md#patch-bootimg-with-magisk)
- [GSI](https://github.com/4bitFox/hisense_a7cc/blob/main/README.md#gsi)

---


# Developer options
Differently to other phones you have to spam-click Kernel version: Settings -> About Phone -> spam Kernel version

Developer options will then appear in Settings -> System & Updates -> Developer options



# Recovery + Wipe user data
So far ```fastboot -w``` hasn't seemed to work so I delete userdata trough recovery:

Press E-Ink Button + VolDown + Power Button until the phone reboots.
![recovery1.png](https://github.com/4bitFox/hisense_a7cc/blob/main/img/recovery1.png)




# Restore to stock rom
> [!WARNING]
> This will wipe your userdata!

Download original rom from pan.baidu.com:

> [!TIP]
> pan.baidu.com asks for chinese phone number only... :-/
> 
> If you don't have a chinese BaiDu account, register here: https://passport.baidu.com/v2/?reg&overseas=1
> You can then log in on the same page using "已有账号？ 登录" in case it redirects you somewhere else :-)
> 
> After that you can open the pan.baidu.com link and you are logged in. You need the BaiDu app to download.

```
https://fans.hisense.com/forum.php?mod=viewthread&tid=206299
| | | | | | | | 
V V V V V V V V 
https://pan.baidu.com/s/1vqnu6SUCY6hBpmEdFAx4Vw?#list/path=%2F
code: iops
```

Put stock rom files on SD Card formatted as FAT32. There should be a folder named HNR320T_TF at the root of the SD Card which then contains the bin files.

Put the SD Card in your phone and press E-Ink Button + VolUp + Power Button. It should then flash the screen after a few seconds. Release the buttons. It should now install the stock rom.

![restore-stock1.png](https://github.com/4bitFox/hisense_a7cc/blob/main/img/restore-stock1.jpg)

Fun fact: I accidentally first used a A7 rom and it worked. I just had no colors obviously xD. Whooops




# Fastboot
The phone supports fastboot commands when booted into botloader. I wasn't able to flash anything in the bootloader tough.

Using ```adb reboot bootloader``` or if you are in the bootloader ```fastboot reboot fastboot``` you can get into proper fastboot.

```fastboot fetch``` desn't work so you can't [back up partitions](https://github.com/4bitFox/hisense_a7cc/blob/main/README.md#backup-partitions) this way... :-/

```fastboot boot``` doesn't work either D-:
![fastboot1.jpg](https://github.com/4bitFox/hisense_a7cc/blob/main/img/fastboot1.jpg)





# BACKUP Partitions
> [!WARNING]
> Entering autodload aparrently [WIPES your splloader](https://github.com/TomKing062/CVE-2022-38694_unlock_bootloader/issues/6#issuecomment-1627545223)! By entering it you will be stuck in emergency download mode (Ask me how I found out :-D). Your phone will NOT boot normally, even with hardware key combos!! It was a huge pain to get this to work. I didn't manage to make the program recognize my phone in Windows, even after installing all the driver shenanigans. Without the program flashing back splloader you phone is unuseable so think about it twice!!!!

Your screen will freeze and be unresponsive as soon as you enter this command until you leave autodload again, so get your sussy stuff off the screen before you run this ;-)
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
https://github.com/TomKing062/CVE-2022-38694_unlock_bootloader/tree/info/soc/ud710

In case the files are not around anymore in the above link:
https://github.com/4bitFox/CVE-2022-38694_unlock_bootloader/releases
https://github.com/4bitFox/CVE-2022-38694_unlock_bootloader/tree/info/soc/ud710
```
![spd-dump-files1.png](https://github.com/4bitFox/hisense_a7cc/blob/main/img/spd-dump-files1.png)

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
![spd-dump1.png](https://github.com/4bitFox/hisense_a7cc/blob/main/img/spd-dump1.png)

### Exit autodload:
Here we flash splloader partition so the phone can boot again. Replace u-boot-spl-16k-sign.bin with your splloader in case you have a backup of it before you entered autodload which wiped it.
```
./spd_dump exec_addr 0x3f28 fdl fdl1-dl.bin 0x5500 fdl uboot-mod.bin 0x9efffe00 exec erase_part uboot_log write_part splloader u-boot-spl-16k-sign.bin timeout 100000 reset
```



# Patch boot.img with Magisk
Use "Backup" section to extract boot.img
> [!WARNING]
> Always keep a copy of your original boot image in case something goes wrong!!!

Put the extracted boot.img into phone storage. Patch with Magisk app and copy patched img back to the PC.

Get avbtool and key file (put them in same folder):
```
https://android.googlesource.com/platform/external/avb/+/refs/heads/main/avbtool.py
https://github.com/unisoc-android/unisoc-android.github.io/blob/master/subut/assets/rsa4096_vbmeta.pem
```

We can now look at our boot image info using:

```
python3 avbtool.py info_image --image MAGISK_PATCHED_FILENAME.img
```
Output will look like this:
```
Footer version:           1.0
Image size:               36700160 bytes
Original image size:      19582976 bytes
VBMeta offset:            19582976
VBMeta size:              2112 bytes
--
Minimum libavb version:   1.0
Header Block:             256 bytes
Authentication Block:     576 bytes
Auxiliary Block:          1280 bytes
Public key (sha1):        2597c218aae470a130f61162feaae70afd97f011
Algorithm:                SHA256_RSA4096
Rollback Index:           0
Flags:                    0
Rollback Index Location:  0
Release String:           'avbtool 1.1.0'
Descriptors:
    Hash descriptor:
      Image Size:            19773440 bytes
      Hash Algorithm:        sha256
      Partition Name:        boot
      Salt:                  5f55215fd2302d021f850b55912ed48d176784678692dc012e054b1ecd0be025
      Digest:                881f81e8fab4830fe1fcc7b54e1e4e51a13d09f70d006f918568fb1361050583
      Flags:                 0
```
Using this info we can now enter the command with correct parameters to sign our image:

```
python3 avbtool.py add_hash_footer --image MAGISK_PATCHED_FILENAME.img --partition_name boot --partition_size 36700160 --key rsa4096_vbmeta.pem --algorithm SHA256_RSA4096 --salt 5F55215FD2302D021F850B55912ED48D176784678692DC012E054B1ECD0BE025
```
You can now flash the signed image using fastboot.



# GSI
WIP together with @denzilferreira Huge thanks to him :-)

So far I have messed around with the LineageOS GSIs from [Andy Yan](https://sourceforge.net/projects/andyyan-gsi/files/). Sadly none of the ones I tried seem to work.

The lineage-21-light and lineage-21-td-vndklite images resulted in the phone rebooting into its bootloader.

The lineage-21-td build and aosp-14-td were different in that they booted into recovery instead.


## E-Ink controls
#### Huge props to @denzilferreira sensei!! Check out this [E-Ink control](https://github.com/denzilferreira/vendor_hisense/releases) app (A9 only currently)!
```
/sys/devices/platform/soc/soc:ap-ahb/20400000.dsi/20400000.dsi.0/display/panel0/epd_white_threshold
/sys/devices/platform/soc/soc:ap-ahb/20400000.dsi/20400000.dsi.0/display/panel0/epd_commit_bitmap
/sys/devices/platform/soc/soc:ap-ahb/20400000.dsi/20400000.dsi.0/display/panel0/epd_usbswitch
/sys/devices/platform/soc/soc:ap-ahb/20400000.dsi/20400000.dsi.0/display/panel0/epd_power
/sys/devices/platform/soc/soc:ap-ahb/20400000.dsi/20400000.dsi.0/display/panel0/epd_contrast
/sys/devices/platform/soc/soc:ap-ahb/20400000.dsi/20400000.dsi.0/display/panel0/epd_connect
/sys/devices/platform/soc/soc:ap-ahb/20400000.dsi/20400000.dsi.0/display/panel0/epd_display_mode
/sys/devices/platform/soc/soc:ap-ahb/20400000.dsi/20400000.dsi.0/display/panel0/epd_force_clear
/sys/devices/platform/soc/soc:ap-ahb/20400000.dsi/20400000.dsi.0/display/panel0/epd_temp
/sys/devices/platform/soc/soc:ap-ahb/20400000.dsi/20400000.dsi.0/display/panel0/epd_black_threshold
/sys/devices/platform/soc/soc:ap-ahb/20400000.dsi/20400000.dsi.0/display/panel0/epd_vcom
```
```
Values of "cat /sys/devices/platform/soc/soc:ap-ahb/20400000.dsi/20400000.dsi.0/display/panel0/epd_display_mode"

clear       1049091
balanced    513
smooth      518
fast        521
```
```echo 1 > /sys/devices/platform/soc/soc:ap-ahb/20400000.dsi/20400000.dsi.0/display/panel0/epd_force_clear``` clears the screen.


