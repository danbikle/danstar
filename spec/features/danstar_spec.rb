# spec/features/danstar_spec.rb
require 'rails_helper'

describe 'Hello danstar', :js => true do
  it 'looks for stars' do
    visit '/cstar/index'
    page.fill_in 'uname1', :with => 'ab'
    page.fill_in 'uname2', :with => 'danbikle'
    click_on('submit')
    expect(page).to have_content 'Star Count Winner'
    end
end
