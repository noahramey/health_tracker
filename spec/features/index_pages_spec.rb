require 'rails_helper'

describe 'the web app process' do
  it "should redirect if a user is not signed in" do
    visit foods_path
    expect(page).to have_content 'You need to sign in or sign up before continuing.'
  end

  it "should take you to the food index page if you are signed in", js: true do
    user = FactoryGirl.create(:user)
    login_as(user, :scope => :user)
    visit foods_path
    save_and_open_screenshot
    expect(page).to have_content 'Foods'
  end
end
