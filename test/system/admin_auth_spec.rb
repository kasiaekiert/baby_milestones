# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Admin auth actions' do
  let(:admin) { create(:admin) }

  it 'can log in as an admin' do
    visit root_path
    # click_link 'Log in'
    # fill_in 'Name', with: admin.email
    # fill_in 'Password', with: admin.password
    # click_button 'Log in'
    expect(page).to have_content 'Hello Admin!'

    visit admins_root_path
    click_link 'Log out'
    expect(page).to have_content 'Log in page'
  end
end
