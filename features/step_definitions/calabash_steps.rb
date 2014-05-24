require 'calabash-android/abase'

load '/Users/saikrishna/Wrappermethods/commonmethods/sample.rb'


When(/^I press button$/) do
  macro 'verify command'

  swipe_left_and_wait_to_animate(10,'row_list')
 # scroll_down_until_element_exists('blinkbox music')

=begin

  touch_screen($sign_in)
  wait_for_element($user_name, 10)
  send_text($user_name, 'sai')
  wait_for_animate
=end

end


Then(/^verify command$/)do

  puts 'calling macro'
end

def touch_screen(field)

  touch("* marked:'#{field}'")

end


def send_text(id, text)
  query("* marked:'#{id}'", :setText => "#{text}")


end

def wait_for_element(id, waitTime)
  wait_for_elements_exist ["* marked:'#{id}'"], timeout: waitTime
end

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


def swipe_right_and_wait_to_animate(wait_time,element_to_animate)
  performAction('swipe', 'right')
  wait_to_animate(wait_time,element_to_animate)
end

def swipe_left_and_wait_to_animate(wait_time,element_to_animate)
  performAction('swipe', 'left')
  wait_to_animate(wait_time,element_to_animate)
end


def wait_to_animate(wait_time,element_to_animate)
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

def scroll_up_until_element_exists(elementID)

  query_result = query("* marked:'#{elementID}'")
  while query_result.empty?
    performAction('scroll_up')
    query_result = query("* marked:'#{elementID}'")
  end
  return query_result
end