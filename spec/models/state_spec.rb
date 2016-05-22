require 'rails_helper'

RSpec.describe State, type: :model do
  let!(:state1) {FactoryGirl.create(:state, name: "New", default: false)}
  let!(:state2) {FactoryGirl.create(:state, name: "Closed", default: false)}
  let!(:state3) {FactoryGirl.create(:state, name: "Open", default: true)}

  it '#make_default! sets a default state to true' do
    state1.make_default!

    expect(State.first.default?).to be true
  end

  it '#make_default! sets all other states to false' do
    state1.make_default!

    expect(State.first.default?).to be true
    expect(State.second.default?).to be false
    expect(State.third.default?).to be false
  end
end