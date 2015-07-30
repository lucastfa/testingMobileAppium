require 'spec_helper'

describe "sample app" do

  it "should allow use appium lib commands" do
	button_exact('Click me').click
	expect(exists { text('Hello World') }).to be true
	first_textfield.type "valor"
	button_exact('See details').click
	expect(exists { text('User had put in text: valor') }).to be true
	back
	id("checkBox1").click
  end

end