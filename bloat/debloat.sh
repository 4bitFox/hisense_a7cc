#!/bin/sh


echo Uninstalling user apps.....
adb shell pm uninstall com.jd.app.reader
adb shell pm uninstall com.qq.ac.android
adb shell pm uninstall com.moji.hmct
adb shell pm uninstall com.palmzen.jimmyenglish
adb shell pm uninstall com.hmct.instruction
adb shell pm uninstall com.hmct.userfeedback
adb shell pm uninstall com.hmct.theme.source
adb shell pm uninstall com.hmct.dreams
adb shell pm uninstall com.android.soundrecorder
adb shell pm uninstall com.chaozh.iReaderFree
adb shell pm uninstall com.hmct.hsmemo
adb shell pm uninstall com.yixinjiang.goodbaba.app.presentation.pep
adb shell pm uninstall com.baidu.searchbox
adb shell pm uninstall com.newtonker.puzzle
adb shell pm uninstall sogou.mobile.explorer.hmct
adb shell pm uninstall cmccwm.mobilemusic
adb shell pm uninstall com.ss.android.article.news
adb shell pm uninstall com.hisense.hiphone.payment
adb shell pm uninstall com.kuaikan.comic
adb shell pm uninstall fm.qingting.open.hisense
adb shell pm uninstall com.android.hicompass
adb shell pm uninstall com.hmct.phoneclone.ink
adb shell pm uninstall com.qqreader.hisense
adb shell pm uninstall com.tencent.news
adb shell pm uninstall com.hmct.theme.colorimpression
adb shell pm uninstall com.hmct.theme.quiet
adb shell pm uninstall com.android.calculator2
adb shell pm uninstall com.autonavi.minimap
adb shell pm uninstall com.android.email
adb shell pm uninstall com.appshare.android.ilisten
adb shell pm uninstall com.hisense.hicloud.edca.mobile
adb shell pm uninstall com.andreader.prein
adb shell pm uninstall com.hmct.theme.scholarly
adb shell pm uninstall cn.wps.moffice_eng
adb shell pm uninstall com.hisense.fans.club


echo Disabling system apps.....
adb shell pm disable-user --user 0 com.hisense.hiphone.appstore
adb shell pm disable-user --user 0 com.android.quicksearchbox
adb shell pm disable-user --user 0 com.google.android.overlay.gmsconfig
adb shell pm disable-user --user 0 com.iflytek.speechsuite
adb shell pm disable-user --user 0 com.sprd.autoslt
adb shell pm disable-user --user 0 com.sprd.cameracalibration
adb shell pm disable-user --user 0 com.sprd.cameraipcontrol
adb shell pm disable-user --user 0 com.sprd.engineermode
adb shell pm disable-user --user 0 com.sprd.logmanager
adb shell pm disable-user --user 0 com.sprd.quickcamera
adb shell pm disable-user --user 0 com.sprd.uasetting
adb shell pm disable-user --user 0 com.sprd.uplmnsettings
adb shell pm disable-user --user 0 com.sprd.validationtools
adb shell pm disable-user --user 0 com.android.backup
adb shell pm disable-user --user 0 com.android.modemnotifier
adb shell pm disable-user --user 0 com.android.theme.color.black
adb shell pm disable-user --user 0 com.android.theme.color.cinnamon
adb shell pm disable-user --user 0 com.android.theme.color.green
adb shell pm disable-user --user 0 com.android.theme.color.ocean
adb shell pm disable-user --user 0 com.android.theme.color.orchid
adb shell pm disable-user --user 0 com.android.theme.color.purple
adb shell pm disable-user --user 0 com.android.theme.color.space
adb shell pm disable-user --user 0 com.android.theme.font.notoserifsource
adb shell pm disable-user --user 0 com.spreadtrum.proxy.nfwlocation
adb shell pm disable-user --user 0 com.spreadtrum.sgps
adb shell pm disable-user --user 0 com.spreadtrum.vce
adb shell pm disable-user --user 0 com.tencent.android.location
adb shell pm disable-user --user 0 com.tencent.soter.soterserver
adb shell pm disable-user --user 0 org.ifaa.aidl.manager
adb shell pm disable-user --user 0 com.android.browser
adb shell pm disable-user --user 0 com.android.calendar
adb shell pm disable-user --user 0 com.android.camera2
adb shell pm disable-user --user 0 com.android.contacts # required for dialer to show up in launcher
adb shell pm disable-user --user 0 com.android.cts.ctsshim
#adb shell pm disable-user --user 0 com.android.deskclock # Keep enabled for reliable alarm
#adb shell pm disable-user --user 0 com.android.dialer # Keep enabled for calls on lock screen
adb shell pm disable-user --user 0 com.android.exchange
adb shell pm disable-user --user 0 com.android.gallery3d # Re-Enable when you want to change lockscreen wallpaper
adb shell pm disable-user --user 0 com.android.mms
adb shell pm disable-user --user 0 com.android.musicfx
adb shell pm disable-user --user 0 com.android.printservice.recommendation
adb shell pm disable-user --user 0 com.android.sharedstoragebackup
adb shell pm disable-user --user 0 com.android.simappdialog
adb shell pm disable-user --user 0 com.android.providers.downloads.ui
adb shell pm disable-user --user 0 com.android.hplayer
adb shell pm disable-user --user 0 com.hmct.voiceassist
adb shell pm disable-user --user 0 com.hmct.voicetranslate
adb shell pm disable-user --user 0 com.hmct.antivirus
adb shell pm disable-user --user 0 com.hmct.account
adb shell pm disable-user --user 0 com.hmct.assist
adb shell pm disable-user --user 0 com.android.hmctconsumerservice
adb shell pm disable-user --user 0 com.hmct.appicebox
adb shell pm disable-user --user 0 com.hmct.downloaduilauncher
adb shell pm disable-user --user 0 com.hmct.einklauncher.plugin.wechat
adb shell pm disable-user --user 0 com.hmct.factorylogupload
adb shell pm disable-user --user 0 com.hmct.gamemodefloatwindow
adb shell pm disable-user --user 0 com.hmct.imageedit
adb shell pm disable-user --user 0 com.hmct.jdreader
adb shell pm disable-user --user 0 com.hmct.music
adb shell pm disable-user --user 0 com.hmct.mutualshare
adb shell pm disable-user --user 0 com.hmct.navigation.service
adb shell pm disable-user --user 0 com.hmct.payguard
adb shell pm disable-user --user 0 com.hmct.questionnaire
adb shell pm disable-user --user 0 com.hmct.secretlauncher
adb shell pm disable-user --user 0 com.hmct.SecretFileManager.Activity
adb shell pm disable-user --user 0 com.hmct.userexperienceprogram
adb shell pm disable-user --user 0 com.hmct.hiphone.juplugin
adb shell pm disable-user --user 0 com.hmct.hmctmanual
adb shell pm disable-user --user 0 com.hmct.mobileclear
adb shell pm disable-user --user 0 com.hmct.semantic.analysis
adb shell pm disable-user --user 0 com.android.firewall
adb shell pm disable-user --user 0 com.hmct.theme
adb shell pm disable-user --user 0 org.hapjs.mockup
adb shell pm disable-user --user 0 com.android.einklauncher.plugin.musicplugin
adb shell pm disable-user --user 0 com.hmct.einklauncher.plugin.quickappplugin
adb shell pm disable-user --user 0 com.android.mobilemanager
adb shell pm disable-user --user 0 com.android.einklauncher.plugin.multireader
adb shell pm disable-user --user 0 com.android.guide
adb shell pm disable-user --user 0 com.android.engtest
adb shell pm disable-user --user 0 com.hmct.FileManager.Activity
adb shell pm disable-user --user 0 com.android.gallery3dsecret
adb shell pm disable-user --user 0 com.android.hmct.bmct
adb shell pm disable-user --user 0 com.iflytek.inputmethod
adb shell pm disable-user --user 0 com.hmct.HmctService
adb shell pm disable-user --user 0 com.hmct.clock.systemwidget
adb shell pm disable-user --user 0 com.android.fontOnline
adb shell pm disable-user --user 0 com.android.fontOnline
adb shell pm disable-user --user 0 com.hmct.ftmode
adb shell pm disable-user --user 0 com.hmct.platform.core
adb shell pm disable-user --user 0 com.hmct.mobilesafe.tools.autorun
adb shell pm disable-user --user 0 com.hmct.minidumpservice
adb shell pm disable-user --user 0 com.hmct.worldclockeinkwidget
adb shell pm disable-user --user 0 com.android.provisionforguide
adb shell pm disable-user --user 0 com.hmct.wifidetector
adb shell pm disable-user --user 0 com.android.shadowapps
adb shell pm disable-user --user 0 com.android.hmct.safe
adb shell pm disable-user --user 0 com.android.backupreceiver
adb shell pm disable-user --user 0 com.android.dynsystem
adb shell pm disable-user --user 0 com.hmct.updater
adb shell pm disable-user --user 0 com.android.einklauncher.plugin.flipcalendar
adb shell pm disable-user --user 0 com.hmct.clockeinkwidget
adb shell pm disable-user --user 0 com.android.einklauncher.plugin.memo
adb shell pm disable-user --user 0 com.android.einklauncher.plugin.readlaterplugin
adb shell pm disable-user --user 0 com.android.wallpaper.livepicker
adb shell pm disable-user --user 0 com.hmct.ota.appinstall
adb shell pm disable-user --user 0 com.hmct.einklauncher
adb shell pm disable-user --user 0 com.android.einklauncher.plugin.readtimeplugin
adb shell pm disable-user --user 0 com.hmct.floatwindow


echo rebloat.....
adb install rebloat/at.tomtasche.reader_*.apk
adb install rebloat/ch.blinkenlights.android.vanilla_*.apk
adb install rebloat/com.aurora.store_*.apk
adb install rebloat/com.duckduckgo.mobile.android_*.apk
adb install rebloat/eu.faircode.netguard_*.apk
adb install rebloat/FairEmail*.apk
adb install rebloat/F-Droid*.apk
adb install rebloat/net.sourceforge.opencamera_*.apk
adb install rebloat/org.breezyweather_*.apk
adb install rebloat/org.fossify.calendar_*.apk
adb install rebloat/org.fossify.clock_*.apk
adb install rebloat/org.fossify.contacts_*.apk
adb install rebloat/org.fossify.filemanager_*.apk
adb install rebloat/org.fossify.gallery_*.apk
adb install rebloat/dev.octoshrimpy.quik_*.apk
adb install rebloat/org.fossify.notes_*.apk
adb install rebloat/org.fossify.phone_*.apk # KEEP STOCK DIALER AS DEFAULT DIALER FOR WORKING LOKSCREEN CALLS!!!
adb install rebloat/org.fossify.voicerecorder_*.apk
adb install rebloat/org.mozilla.fennec_fdroid_*.apk
adb install rebloat/Trebuchet*.apk


echo setting dns...
#adb shell settings put global private_dns_mode off
adb shell settings put global private_dns_mode hostname
adb shell settings put global private_dns_specifier 1dot1dot1dot1.cloudflare-dns.com


exit
