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

		wait_for_element($shop_all_groceries_dashboard, 10)
		touch_screen($shop_all_groceries_dashboard)
		wait_for_element('Fresh Food', 10)
		touch_screen('Fresh Food')
		wait_for_element('Fresh Fruit', 10)
		touch_screen('Fresh Fruit')
	  screenshot_embed(:name=> "#{__method__}.png")
		touch_screen('Bananas')

	end



# @param [Object] username

# @param [Object] password


# This method helps the user to singin with respective credentials
	def login(username, password)
		sleep(2)
		touch_screen($sign_in)
		wait_for_element($user_name,5)
		send_text($user_name, username)
		send_text($password, password)
		touch_screen($sign_in)
		sleep(5)


	end


	def add_item

		touch_screen($add_item_button)
	end
end




