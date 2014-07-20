require "set"
require 'spec_helper'

describe DoubleDog::Database::InMemory do
  let(:db) { described_class.new }
  let(:item_1){db.create_item(:name => 'fries', :price => 3)}
  let(:item_2){db.create_item(:name => 'pickle', :price => 4)}
  let(:item_3){db.create_item(:name => 'potato', :price => 8)}
  let(:emp){db.create_user(:username => 'mitch', :password => 'pass1')}

  it "creates an order" do
    order = db.create_order(:employee_id => emp.id, :items => [item_1, item_2, item_3])
    expect(order).to be_a DoubleDog::Order

    expect(order.id).to_not be_nil
    expect(order.employee_id).to eq(emp.id)
  end

  it "retrieves an order" do
    order = db.create_order(:employee_id => emp.id, :items => [item_1, item_2, item_3])
    retrieved_order = db.get_order(order.id)
    expect(retrieved_order).to be_a DoubleDog::Order
    expect(retrieved_order.employee_id).to eq(emp.id)
    expect(retrieved_order.items).to include(item_1, item_2, item_3)
  end

  it "grabs all orders" do
    emp_2 = db.create_user(:username => 'mell', :password => 'pass2')
    emp_3 = db.create_user(:username => 'donald', :password => 'pass3')

    db.create_order(:employee_id => emp.id, :items => [item_1, item_2, item_3])
    db.create_order(:employee_id => emp_2.id, :items => [item_1, item_3])
    db.create_order(:employee_id => emp_3.id, :items => [item_2, item_3])

    orders = db.all_orders
    expect(orders.count).to eq(3)
    expect(orders.map &:employee_id).to include(emp.id, emp_2.id,emp_3.id)
    expect(orders.first.items.count).to be >= 2
  end
end
