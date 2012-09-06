require 'spec_helper'

describe "MainPages" do
  describe "Root page /" do
    it "works!" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      visit root_path
      # page.should have_content('Real Estate')

  		# page.should have_selector('title', :text => "Ruby on Rails Tutorial Sample App | Home")      
  		page.should have_selector('h1', text: 'Real Estate')
    end
  end
end
