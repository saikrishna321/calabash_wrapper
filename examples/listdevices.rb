#!/usr/bin/env ruby -wKU

require 'rubygems'
require "pp"

require File.expand_path('../lib/android-adb/Adb', File.dirname(__FILE__))
require File.expand_path('../lib/android-adb/Device', File.dirname(__FILE__))

adb = AndroidAdb::Adb.new()
puts "Devices:"

pp adb.get_devices

=begin
$device_id=adb.get_devices
count_device=adb.get_devices.count

puts '*****'
$test_port=34501

count_device.times do |i|


     $test_port_convert=$test_port+i
    $test_final_port=$test_port_convert.to_s


    command= "calabash-android run /Users/saikrishna/Calabash-Android/com.tesco.grocery.view-Signed-1.apk_debug.apk ADB_DEVICE_ARG="+ $device_id[i]+ " TEST_SERVER_PORT="+$test_final_port+""
  puts command

system(command)


end



#command = "calabash-android run /Users/saikrishna/Calabash-Android/com.tesco.grocery.view-Signed-1.apk_debug.apk ADB_DEVICE_ARG="+ adb.get_devices[0]+ " TEST_SERVER_PORT="+test_port+""



=end
