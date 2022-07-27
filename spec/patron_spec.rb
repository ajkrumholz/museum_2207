require 'spec_helper'

RSpec.describe Patron do
  let(:patron_1) { described_class.new("Bob", 20) }

  it '#name' do
    expect(patron_1.name).to eq("Bob")
  end

  it '#spending_money' do
    expect(patron_1.spending_money).to eq(20)
  end

  it '#interests' do
    expect(patron_1.interests).to eq([])
  end
end