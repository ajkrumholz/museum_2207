require 'spec_helper'

RSpec.describe Exhibit do
  let(:exhibit) { described_class.new({name: "Gems and Minerals", cost: 0})}

  it '#name' do
    expect(exhibit.name).to eq("Gems and Minerals")
  end

  it 'cost' do
    expect(exhibit.cost).to eq(0)
  end

end