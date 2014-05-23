require 'spec_helper'

describe 'home' do
	it 'should display title' do
		visit '/'
		page.should have_content('Twitter Feed for #NAAwayDay')
	end

  it 'should display single tweets details' do
    visit '/'

    page.should have_content('Thee Namaste Nerdz. #NAAwayDay')
    page.should have_content('@bullcityrecords')
    page.should have_content('Fri Sep 21 23:40')
    page.should have_image("http://a0.twimg.com/profile_images/447958234/Lichtenstein_normal.jpg")
  end



end

module Capybara
  class Session
    def has_image?(src)
      has_xpath?("//img[contains(@src,\"#{src}\")]")
    end
  end
end
