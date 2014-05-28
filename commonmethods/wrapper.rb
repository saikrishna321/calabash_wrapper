require 'calabash-android/abase'
require 'calabash-android/operations'
require 'calabash-android/helpers'
require 'calabash-android/wait_helpers'


# author Sai Krishna && Suhas
# Version Tesco_1.0


#field - pass the argument as ID of the element to be touched
module Wrapper_Methods


def touch_screen(id)

		touch("* marked:'#{id}'")

	end



#id - pass the argument as ID of the element
#waitTime - Time in seconds to wait for the element

# @param [Object] id
# @param [Object] waitTime
	public_methods
	def wait_for_element(id, waitTime)
		wait_for_elements_exist ["* marked:'#{id}'"], timeout: waitTime
	end



#id - pass the argument as ID of the element
#waitTime - Time in seconds to wait for the element to disappear

	def wait_for_element_to_disapper(id, waitTime)

		wait_for_elements_do_not_exist ["* marked:'#{id}'"], timeout: waitTime
	end



#id - pass the argument as ID of the element
#text - Text to send into the editText Field
#wait_for_keyboard - can be set to true or false if you want to wait for the keyboard to appear,if the keyboard is already displayed set to false
#wait_for_keyboard - works only with iPhone and iPad

	def send_text(id, text, options={:wait_for_keyboard => true})

		puts 'PLATFORM'
		if ENV['PLATFORM'] =='android'
			query("* marked:'#{id}'", :setText => "#{text}")
		else
			if ENV['PLATFORM'] == 'ios'
				touch(id)
				wait_for_keyboard unless options[:wait_for_keyboard] == false
				keyboard_enter_text(text)

			end

		end
	end



	#validation_msg - Pass the text that needs to be asserted on the screen
	def assert_text_on_screen(validation_msg)
		sleep(2)
		puts "#{validation_msg}"
		text_from_screen=query("*", "text")
		element_present=text_from_screen.include? validation_msg
		assert_equal true, element_present
	end



	def assert_two_arrays(a1, a2, msg = nil)
		[:select, :inject, :size].each do |m|
			[a1, a2].each { |a| assert_respond_to(a, m, "Are you sure that #{a.inspect} is an array?  It doesn't respond to #{m}.") }
		end

		assert a1h = a1.inject({}) { |h, e| h[e] ||= a1.select { |i| i == e }.size; h }
		assert a2h = a2.inject({}) { |h, e| h[e] ||= a2.select { |i| i == e }.size; h }

		assert_equal(a1h, a2h, msg)
	end



	def check_element_present(field)
		check_element_exists("* marked:'#{field}'")
	end



	#wait_time - time in seconds
	#element_to_animate - element id to validate after the swipe
	def swipe_right_and_wait_to_animate(wait_time, element_to_animate)
		if ENV['PLATFORM'] == 'android'
			performAction('swipe', 'right')
			wait_to_animate(wait_time, element_to_animate)
		else
			if ENV['PLATFORM'] == 'iPhone'
				#TODO Suhas Pls add Iphone swipe test
			end
		end
	end



	#wait_time - time in seconds
	#element_to_animate - element id to validate after the swipe
	def swipe_left_and_wait_to_animate(wait_time, element_to_animate)
		if ENV['PLATFORM'] == 'android'
			performAction('swipe', 'left')
			wait_to_animate(wait_time, element_to_animate)
		else
			if ENV['PLATFORM'] == 'iPhone'
				#TODO Suhas Pls add Iphone swipe test

			end
		end
	end



	#wait_time - time in seconds
	#element_to_animate - element id to validate the wait
	def wait_to_animate(wait_time, element_to_animate)
		wait_for(:timeout => wait_time) { query("* marked:'#{element_to_animate}'").size > 0 }
	end



	def scroll_down_until_element_exists(elementID)

		query_result = query("* marked:'#{elementID}'")
		while query_result.empty?
			performAction('scroll_down')
			query_result = query("* marked:'#{elementID}'")
		end
		return query_result
	end


end

