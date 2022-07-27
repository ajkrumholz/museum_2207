require 'spec_helper'

RSpec.describe Museum do
  let(:dmns) { described_class.new("Denver Museum of Nature and Science") }
  let(:gems_and_minerals) { Exhibit.new({name: "Gems and Minerals", cost: 0}) }
  let(:dead_sea_scrolls) { Exhibit.new({name: "Dead Sea Scrolls", cost: 10}) }
  let(:imax) { Exhibit.new({name: "IMAX",cost: 15}) }

  it '#name' do
    expect(dmns.name).to eq("Denver Museum of Nature and Science")
  end

  it '#exhibits' do
    expect(dmns.exhibits).to eq([])
  end

  it '#add_exhibit' do
    dmns.add_exhibit(gems_and_minerals)
    dmns.add_exhibit(dead_sea_scrolls)
    dmns.add_exhibit(imax)
    expect(dmns.exhibits).to eq([gems_and_minerals, dead_sea_scrolls, imax])
  end
end