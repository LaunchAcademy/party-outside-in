require 'spec_helper'

feature 'user views parties' do
  # As a party planner
  # I want to view a list of all parties I'm planning
  # So that I can figure out who might be interested in joining me for each
  #
  # Acceptance Criteria:
  #
  # If I go to the root path, I should be redirected to /parties.
  # On the parties index page at /parties, I should see the name of each party.
  scenario 'go to /parties, see parties' do
    party_one = FactoryBot.create(:party)
    # Party.create!({name: 'Amazing Launch Partaaayyy'})
    party_two = FactoryBot.create(:party)

    visit '/parties'
    expect(page).to have_content(party_one.name)
    expect(page).to have_content(party_two.name)
  end

  scenario 'go to root, see parties' do
    party_one = FactoryBot.create(:party)
    party_two = FactoryBot.create(:party)

    visit '/'
    expect(page).to have_content(party_one.name)
    expect(page).to have_content(party_two.name)
  end
end