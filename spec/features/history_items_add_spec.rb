require "rails_helper"
feature "HistoryItems", js: true do
  scenario "page initially has no items" do
    create_user_and_sign_in
    project = create(:project)
    visit project_history_items_path(project.id)

    expect(page).to have_content("No comments or updates found")
  end

  scenario "adding items" do
    create_user_and_sign_in
    project = create(:project)
    visit project_history_items_path(project.id)

    select("Comment", from: :history_item_type)
    fill_in :history_item_body, with: "test comment"
    click_on "Create History item"

    expect(page).to have_content("NEW COMMENT")
    expect(page).to have_content("test comment")

    select("Status Change", from: :history_item_type)
    fill_in :history_item_body, with: "test status change"
    click_on "Create History item"

    expect(page).to have_content("NEW STATUS")
    expect(page).to have_content("test status change")
  end
end

def create_user_and_sign_in
  create :user, email: "user@test.com", password: "password"
  visit new_user_session_path
  fill_in :user_email, with: "user@test.com"
  fill_in :user_password, with: "password"
  click_on "Log in"
end
