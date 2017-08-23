require 'spec_helper'
require './app'

#Integrated feature test of the attack screen

feature 'Feature Testing the Attack Screen' do

  before :each do
    sign_in_and_play
  end

  scenario 'There is a next turn button on the attack screen' do
    visit('/attack')
    expect(page).to have_selector('input[type=submit][value="Next Turn"]')
  end

  scenario 'The players change turns attacking each other' do
    visit('/attack')
    expect(page).to have_content('Name 1 attacked Name 2 and caused')
    click_button('Next Turn')
    click_button('Attack!')
    expect(page).to have_content('Name 2 attacked Name 1 and caused')
  end

end
