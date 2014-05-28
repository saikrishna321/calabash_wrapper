require 'calabash-android/abase'
require 'calabash-android/operations'
require 'calabash-android/helpers'
require 'calabash-android/wait_helpers'

require File.expand_path('../commonmethods/appIds', File.dirname(__FILE__))
require File.expand_path('../commonmethods/wrapper', File.dirname(__FILE__))

class AppWrapper < Calabash::ABase
	include Wrapper_Methods
	include Testdata



	def open_side_nav
		wait_for_element($side_nav, 5)
		touch_screen($side_nav)
		sleep(2)
	end


	def shop_all_groceries
		touch_screen($shop_all_groceries_dashboard)
		touch_screen('Fresh Food')
		touch_screen('Fresh Fruit')
		touch_screen('Bananas')
	end



# @param [Object] username

# @param [Object] password


# This method helps the user to singin with respective credentials
	def login(username, password)

		touch_screen($sign_in)
		send_text($user_name, username)
		send_text($password, password)
		touch_screen($sign_in)
	end


end




