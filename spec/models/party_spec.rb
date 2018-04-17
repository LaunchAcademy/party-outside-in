require 'spec_helper'

describe Party do
  let(:party) do
    # p = Party.new
    # p.name = "Sox Game: wicked awesome"
    # p.location = "Boston, MA"
    # p.description = "We'll have a couple beers after we go to the packie"
    # p
    FactoryBot.build(:party)
  end

  it 'requires a name' do
    party.name = nil
    expect(party.save).to eq(false)
    expect(party.errors[:name]).to_not be_nil
  end

  it 'requires a location' do
    party.location = nil
    expect(party.save).to eq(false)
    expect(party.errors[:location]).to_not be_nil
  end

  it 'requires a description' do
    party.description = nil
    expect(party.save).to eq(false)
    expect(party.errors[:description]).to_not be_nil
  end
end