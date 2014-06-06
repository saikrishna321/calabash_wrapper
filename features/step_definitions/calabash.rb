require 'calabash-android/abase'


require 'rubygems'
require "pp"
require File.expand_path('../../commonmethods/appIds', File.dirname(__FILE__))
require File.expand_path('../../commonmethods/wrapper',File.dirname(__FILE__))

require File.expand_path('../../lib/android-adb/Adb', File.dirname(__FILE__))
require File.expand_path('../../lib/android-adb/Device', File.dirname(__FILE__))

include Testdata
#include Wrapper_Methods
When(/^I call macro methods and i must see the devices connected$/) do


	macro 'verify command'

  adb = AndroidAdb::Adb.new()
  puts "Devices:"

  pp adb.get_devices

  touch_screen($sign_in)

   if adb.get_devices[0] == '0149CC3B0F00601'
	   send_text($user_name,'testing')
   else
	   send_text($user_name,'Failed testing')
   end


end



