require 'rails_helper'
feature 'a comment is added', js: true do
  scenario 'and turbostream updates page' do
    create_user_and_sign_in
    project = create(:project)
    visit project_history_items_path(project.id)

    expect(page).to have_content("No comments or updates found")
  end
end

def create_user_and_sign_in
  create :user, email: 'user@test.com', password: 'password'
  visit new_user_session_path
  fill_in :user_email, with: 'user@test.com'
  fill_in :user_password, with: 'password'
  click_on 'Log in'
end

