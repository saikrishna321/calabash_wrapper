if ENV['PLATFORM'] == 'android'
	require 'calabash-android/cucumber'
elsif ENV['PLATFORM'] == 'ios'
	require 'calabash-cucumber/cucumber'
end

