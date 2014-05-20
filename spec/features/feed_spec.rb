require 'spec_helper'

describe 'home' do
	it 'should display title' do
		visit '/'
		page.should have_content('Twitter Feed for #NAAwayDay')
	end
end

