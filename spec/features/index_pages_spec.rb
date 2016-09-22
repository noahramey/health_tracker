require 'rails_helper'

describe 'the web app process' do
  it "should redirect if a user is not signed in" do
    visit foods_path
    expect(page).to have_content 'You need to sign in or sign up before continuing.'
  end
end
