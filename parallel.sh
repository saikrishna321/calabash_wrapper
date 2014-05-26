#!/bin/bash 
declare -a arr
let i=0
export ANDROID_HOME=/Users/saikrishna/Softwares/android-sdks
while read line #get devices list
do
if [ -n "$line" ] && [ "`echo $line | awk '{print $2}'`" == "device" ]
    then
        device="`echo $line | awk '{print $1}'`"
        echo "Add $device"
        arr[i]="$device" # $ is optional
        let i=$i+1
fi
done

let port=34800 #starting port - can be a random port ( choosen by fair dice roll )
for deviceid in "${arr[@]}" #for each connected device start test on a specified port
do
mkdir $deviceid
#Set important variables for execution
ADB_DEVICE_ARG=$deviceid TEST_SERVER_PORT=$port SCREENSHOT_PATH=$deviceid/ calabash-android run /Users/saikrishna/calabash_wrapper/com.tesco.grocery.view-Signed-1.apk_debug.apk --format html --out "$deviceid"_report.html & #Start test and do html report
port=$((port+1)) #increase port
done