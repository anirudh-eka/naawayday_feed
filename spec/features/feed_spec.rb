require 'spec_helper'

describe 'home' do
  let(:profile_image) {"http://a0.twimg.com/profile_images/447958234/Lichtenstein_normal.jpg"}
  let(:media_image) {"https://pbs.twimg.com/media/BoqqU1wIMAAr_zO.jpg"}
	it 'should display title' do
		visit '/'
		page.should have_content('Twitter Feed for #NAAwayDay')
	end

  it 'should display single tweets details' do
    visit '/'

    page.should have_content('Thee Namaste Nerdz. #NAAwayDay')
    page.should have_content('@bullcityrecords')
    page.should have_content('Fri Sep 21 23:40')
    page.should have_image(profile_image)
    page.should have_image(media_image)
  end

  it 'should add a tweet via automatic update', :js=> true do
    visit '/'

    page.should have_content('Thee Namaste Nerdz. #NAAwayDay')
    page.should have_content('@bullcityrecords')
    page.should have_content('Fri Sep 21 23:40')

    sleep(5.seconds)

    page.should have_content("DAT ISH CRAY AIN'T IT #NAAwayDay")
    page.should have_content('@bullcity')
    page.should have_content('Fri Sep 21 23:50')
    page.should have_content('Thee Namaste Nerdz. #NAAwayDay')
    page.should have_content('@bullcityrecords')
    page.should have_content('Fri Sep 21 23:40')
  end

end

module Capybara
  class Session
    def has_image?(src)
      has_xpath?("//img[contains(@src,\"#{src}\")]")
    end
  end
end
