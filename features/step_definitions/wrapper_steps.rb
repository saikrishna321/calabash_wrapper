
require File.expand_path('../../commonmethods/appIds', File.dirname(__FILE__))
require File.expand_path('../../commonmethods/app_wrappers', File.dirname(__FILE__))
require File.expand_path('../../commonmethods/wrapper', File.dirname(__FILE__))
require File.expand_path('../../commonmethods/user', File.dirname(__FILE__))

include Wrapper_Methods
Given(/^as a user i'm logging into the application$/) do

	@current_page=page(AppWrapper)

	#@wrapper_page=touch_screen($sign_in)
	puts $test_login
	@current_page.login($test_login,$test_passsword)


end


When(/^the user enters the PLP page from shop all groceries$/) do

#	@current_page.shop_all_groceries
#	@current_page.add_item
end

Then(/^I should see a network error message$/) do

end

When(/^I login$/) do

end