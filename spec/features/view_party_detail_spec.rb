require 'spec_helper'

feature 'view party detail' do
  # As a party planner
  # I want to view the details of a party
  # So that I can learn more about what fun is planned
  #
  # Acceptance Criteria:
  #
  # On the parties index page, the name of each party should be a link to the party's show page.
  # On the show page, I should see the name, description, and location of the party.

  scenario 'view party detail' do
    party = FactoryBot.create(:party)
    visit "/parties"
    click_link(party.name)
    expect(page).to have_content(party.location)
    expect(page).to have_content(party.description)
  end
end
