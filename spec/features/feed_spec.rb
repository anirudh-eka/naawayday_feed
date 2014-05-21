require 'spec_helper'

describe 'home' do
	it 'should display title' do
		visit '/'
		page.should have_content('Twitter Feed for #NAAwayDay')
	end

  it 'should display single tweet' do
    visit '/'
    page.should have_content('Get Ready #NAAwayDay')
  end
end

