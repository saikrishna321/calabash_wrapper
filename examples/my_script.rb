#!/usr/bin/env ruby -wKU

$LOAD_PATH << '.'

require '/System/Library/Frameworks/Ruby.framework/Versions/2.0/usr/lib/ruby/2.0.0/rexml/xpath_parser.rb'
require 'Date'
require 'test/unit/assertions'


USERS = {
    :karl => {
        :email => "karl@lesspainful.com",
        :password => "Calabash123"
    },
    :invalid => {
        :email => "jonas2@lesspainful.com",
        :password => "1234567892"
    }
}



LIST={
        :coupon => ["Double Points When you shop in store or online at tesco.com/groceries. Valid from 21/10/2013 until 17/11/2013.",
                    "30 extra points When you buy any Muller light yogurt or dessert",
                    "Double Points When you shop in store or online at tesco.com/groceries. Valid until 20/10/2013",
                   "60p off When you buy any Tropicana Pure Premium  juice 1ltr"]




}




#puts USERS[:invalid].to_a

final_array=LIST[:coupon].to_a

puts final_array[1]
#user[:email]


a=['1,2,3,5']
binding=['5,3,2,1']

#b=a.compare(binding)

text= " sai krishn "

puts text.gsub(/\s+/,"")


puts '**********BharathTest********'


begin
 puts 'i am at the start'
	rescue RuntimeError,SignalException,NoMemoryError
   puts 'I back'


	retry
end



a = 10
b = 42

begin

	puts 'i am getting the hold'
	c= a.equal?b

rescue
	puts "Could not add variables a (#{a.class}) and b (#{b.class})"
retry

end
def count_date


r=Date.today

# 11 days,156 days,160 days,196
#Add two days to current date and change the format
array_date = Array.new
default='Expires in 3 days'
array_date.push default

arr=[11,156,160]
arr.each do |i|

  now_days=(r+i)
  changed_format=now_days.strftime('%d/%m/%y')

#convert date to string

  converted_date_string=changed_format.to_s

  #puts converted_date_string
#Add the current date to array

  string='Expires on ' + converted_date_string


  array_date.push string


end
return array_date
end

















