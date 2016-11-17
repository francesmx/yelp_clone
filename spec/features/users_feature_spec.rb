require 'rails_helper'

feature 'User can sign in and out' do
  context 'homepage for user not signed-in' do
    it 'should see "sign in" and "sign up" links' do
      visit '/'
      expect(page).to have_link 'Sign in'
      expect(page).to have_link 'Sign up'
    end
    it 'should not see "sign out" link' do
      visit '/'
      expect(page).not_to have_link 'Sign out'
    end
  end

  context 'User is signed in' do
    before do
      sign_up_and_sign_in
    end

    it 'should see "sign out" link' do
      visit '/'
      expect(page).to have_link 'Sign out'
    end

    it 'should not see a "sign in" or "sign up" link' do
      visit '/'
      expect(page).not_to have_link 'Sign in'
      expect(page).not_to have_link 'Sign up'
    end
  end

  context 'User is not signed in' do
    it "won't let you add a restaurant" do
      visit '/'
      click_link 'Add a restaurant'
      expect(page).to have_content 'You need to sign in or sign up before continuing'
    end
  end
end
