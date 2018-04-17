require 'spec_helper'

feature 'add new party' do
  # As a party planner
  # I want to create a party
  # So that I can plan all the fun things I want to do

  # Acceptance Criteria:
  #
  # There should be a link from the parties index page that takes you to the parties new page. On this page there is a form to create a new party.
  # I must supply a name, location, and description of the party.
  # If the form submission is successful, I should be brought to the party's show page, and I should see a message that lets me know that I have created a party successfully.
  # If the form submission is unsuccessful, I should remain on the parties new page. The form should be pre-filled with the values that were provided when the form was submitted.

  before(:each) do
    visit '/parties'
    click_link "Add New Party"
  end

  scenario 'create a valid party' do
    fill_in "Name", with: "Awesome party"
    fill_in "Location", with: "Boston, MA"
    fill_in "Description", with: "It will be fun"
    click_button "Add"
    # expect(page).to have_content("Party added")
    expect(page).to have_link("Awesome party")
  end

  scenario 'create an invalid party' do
    click_button "Add"
    save_and_open_page
    expect(page).to have_text("can't be blank")
  end
end
