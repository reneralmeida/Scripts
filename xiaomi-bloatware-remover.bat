@ECHO OFF
SET ADBdir="E:\Android tools\plataform-tools"
IF NOT EXIST %ADBdir% (
@ECHO ERROR: %ADBdir% does not exist
GOTO :EOF
)
SET TMPcmds=%TMP%\adbCmds.cmd

pushd %ADBdir%
adb devices | findstr /R /C:”device$” || (
@ECHO ERROR: no adb device found
GOTO :EOF
)

@ECHO disabled packages ____________
adb shell pm list packages -d
@ECHO.

type nul > “%TMPcmds%
for %%X in (
"com.android.chrome"
"cn.wps.xiaomi.abroad.lite"
"com.autonavi.minimap"
"com.caf.fmradio"
"com.duokan.phone.remotecontroller"
"com.samsung.aasaservice"
"org.simalliance.openmobileapi.service"
"com.duokan.phone.remotecontroller.peel.plugin"
"com.bsp.catchlog"
"com.netflix.partner.activation"
"com.netflix.mediaclient"
"com.facebook.katana"
"com.facebook.appmanager"
"com.facebook.services"
"com.facebook.system"
"pl.zdunex25.updater"
"com.xiaomi.xmsfkeeper"
"com.xiaomi.xmsf"
"com.xiaomi.simactivate.service"
"com.xiaomi.scanner"
"com.xiaomi.payment"
"com.xiaomi.misettings"
"com.xiaomi.mirror"
"com.xiaomi.mirecycle"
"com.xiaomi.mircs"
"com.xiaomi.miplay_client"
"com.xiaomi.mipicks"
"com.xiaomi.midrop"
"com.xiaomi.micloud.sdk"
"com.xiaomi.mi_connect_service"
"com.xiaomi.location.fused"
"com.xiaomi.joyose"
"com.xiaomi.glgm"
"com.xiaomi.discover"
"com.xiaomi.cameratools"
"com.xiaomi.calendar"
"com.xiaomi.account"
"com.sohu.inputmethod.sogou.xiaomi"
"com.miui.zman"
"com.miui.yellowpage"
"com.miui.wmsvc"
"com.miui.vsimcore"
"com.miui.virtualsim"
"com.miui.videoplayer"
"com.miui.userguide"
"com.miui.translation.kingsoft"
"com.miui.touchassistant"
"com.miui.systemui.carriers.overlay"
"com.miui.system"
"com.miui.smsextra"
"com.miui.screenrecorder"
"com.miui.qr"
"com.miui.player"
"com.miui.phrase"
"com.miui.notes"
"com.miui.nextpay"
"com.miui.newmidrive"
"com.miui.msa.global"
"com.miui.miwallpaper.mars"
"com.miui.miwallpaper.earth"
"com.miui.miwallpaper"
"com.miui.misound"
"com.miui.mishare.connectivity"
"com.miui.miservice"
"com.miui.micloudsync"
"com.miui.hybrid.accessory"
"com.miui.hybrid"
"com.miui.huanji"
"com.miui.greenguard"
"com.miui.freeform"
"com.miui.fmservice"
"com.miui.fm"
"com.miui.face"
"com.miui.extraphot"
"com.miui.enbbs"
"com.miui.contentcatcher"
"com.miui.compass"
"com.miui.cloudservice.sysbase"
"com.miui.cloudservice"
"com.miui.cloudbackup"
"com.miui.cleanmaster"
"com.miui.cit"
"com.miui.bugreport"
"com.miui.backup"
"com.miui.aod"
"com.miui.android.fashiongallery"
"com.miui.analytics"
"com.miui.accessibility"
"com.mipay.wallet.in"
"com.mipay.wallet.id"
"com.milink.service"
"com.mi.webkit.core"
"com.mi.health"
"com.mi.globalTrendNews"
"com.mi.android.globalpersonalassistant"
"com.mi.android.globallauncher"
"com.mfashiongallery.emag"
"com.google.android.feedback"
"com.google.android.apps.wellbeing"
) do (
adb shell pm list packages -s | findstr %%X && @ECHO adb shell pm uninstall –user 0 %%X >> “%TMPcmds%”
)
FOR %%F in (%TMPcmds%) DO (
IF %%~zF EQU 0 (
echo nothing to do
GOTO :EOF
)
)
type %TMPcmds%
@ECHO ……………………………
SET Answer=n
SET /P Answer=OK to run the above commands? y/[n]
IF “%Answer%” EQU “y” (
%TMPcmds%
popd
)
break