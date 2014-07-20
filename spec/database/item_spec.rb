require 'spec_helper'


describe DoubleDog::Database::InMemory do
  let(:db) { described_class.new }
  let(:item){ db.create_item(:name => 'hot dog', :price => 5)}

  context "created item" do
    let(:retrieved_item){item}
    it_behaves_like 'Item'
  end

  context "retrieved item" do
    let(:retrieved_item){db.get_item(item.id)}
    it_behaves_like 'Item'
  end

  it "grabs all items" do
    db.create_item(:name => 'fries', :price => 3)
    db.create_item(:name => 'pickle', :price => 4)
    db.create_item(:name => 'potato', :price => 8)

    items = db.all_items
    expect(items.count).to eq 3
    expect(items.first).to be_a DoubleDog::Item
    expect(items.map &:name).to include('fries', 'pickle', 'potato')
    expect(items.map &:price).to include(3, 4, 8)
  end
end
