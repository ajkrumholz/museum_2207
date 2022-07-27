require 'spec_helper'

RSpec.describe Museum do
  let(:dmns) { described_class.new("Denver Museum of Nature and Science") }

  it '#name' do
    expect(dmns.name).to eq("Denver Museum of Nature and Science")
  end

  it '#exhibits' do
    expect(dmns.exhibits).to eq([])
  end
end