
require 'calabash-android/management/app_installation'
require 'calabash-android/management/adb'
require 'calabash-android/operations'
AfterConfiguration do |config|
	FeatureNameMemory.feature_name = nil
end

Before('@reinstall') do |scenario|
  @scenario_is_outline = (scenario.class == Cucumber::Ast::OutlineTable::ExampleRow)
  if @scenario_is_outline 
    scenario = scenario.scenario_outline 
  end 

  feature_name = scenario.feature.title
=begin
  if FeatureNameMemory.feature_name != feature_name \
      or ENV["RESET_BETWEEN_SCENARIOS"] == "1"
    if ENV["RESET_BETWEEN_SCENARIOS"] == "1"
      log "New scenario - reinstalling apps"
    else
      log "First scenario in feature - reinstalling apps"
    end
    
    uninstall_apps
    install_app(ENV["TEST_APP_PATH"])
    install_app(ENV["APP_PATH"])
    FeatureNameMemory.feature_name = feature_name
	FeatureNameMemory.invocation = 1
  else
    FeatureNameMemory.invocation += 1
  end
=end

  if scenario.source_tag_names.include?"@reinstall"

    reinstall_apps()
  end
end



FeatureNameMemory = Class.new
class << FeatureNameMemory
  @feature_name = nil
  attr_accessor :feature_name, :invocation
end

