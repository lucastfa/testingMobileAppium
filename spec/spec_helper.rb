#$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'pages'))

require 'rspec'
require 'rspec/expectations'
require 'appium_lib'

RSpec.configure do |config|
  config.before(:all) do
    options = {
      caps: {
        platformName: 'ANDROID',
        deviceName: '192.168.56.101:5555',
        app: File.absolute_path('app-debug.apk')
      },
      launchTimeout: 20000
    }

    driver = Appium::Driver.new(options).start_driver
    driver.manage.timeouts.implicit_wait = 3
    Appium.promote_appium_methods Object
  end

  config.after(:all) do
    driver_quit
  end
end