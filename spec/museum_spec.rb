require 'spec_helper'

RSpec.describe Museum do
  let(:dmns) { described_class.new("Denver Museum of Nature and Science") }
  let(:gems_and_minerals) { Exhibit.new({name: "Gems and Minerals", cost: 0}) }
  let(:dead_sea_scrolls) { Exhibit.new({name: "Dead Sea Scrolls", cost: 10}) }
  let(:imax) { Exhibit.new({name: "IMAX",cost: 15}) }
  let(:patron_1) { Patron.new("Bob", 20)}
  let(:patron_2) { Patron.new("Sally", 20)}
  let(:patron_3) { Patron.new("Johnny", 5)}

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

  it '#recommend_exhibits' do
    dmns.add_exhibit(gems_and_minerals)
    dmns.add_exhibit(dead_sea_scrolls)
    dmns.add_exhibit(imax)
    patron_1.add_interest("Dead Sea Scrolls")
    patron_1.add_interest("Gems and Minerals")
    patron_2.add_interest("IMAX")

    expect(dmns.recommend_exhibits(patron_1)).to eq([ gems_and_minerals, dead_sea_scrolls])
    expect(dmns.recommend_exhibits(patron_2)).to eq([imax])
  end

  it '#patrons' do
    expect(dmns.patrons).to eq([])
  end

  it '#admit' do
    patron_1.add_interest("Dead Sea Scrolls")
    patron_1.add_interest("Gems and Minerals")
    patron_2.add_interest("IMAX")
    patron_3.add_interest("Dead Sea Scrolls")

    dmns.admit(patron_1)
    dmns.admit(patron_2)
    dmns.admit(patron_3)

    expect(dmns.patrons).to eq(patron_1, patron_2, patron_3)
  end





end