require 'rails_helper'

RSpec.describe Order, type: :model do
  #pending "add some examples to (or delete) #{__FILE__}"
  subject { Order.new( product_name: "gears", product_count: 7, customer: FactoryBot.create(:customer))}
  #subject { Order.new(product_name: "product1", product_count: 5, customer_id: 1)}
  it "is valid with valid attributes" do
    expect(subject).to be_valid
  end
  it "is not valid without a product_name" do
    subject.product_name = nil
    expect(subject).to_not be_valid
  end
  it "is not valid without a product_count" do
    subject.product_count = nil
    expect(subject).to_not be_valid
  end
  it "is not valid if product_count is zero" do
    subject.product_count = 0
    expect(subject).to_not be_valid
  end
  it "is not valid if product_count is not a number" do
    subject.product_count = "abc"
    expect(subject).to_not be_valid 
  end
  it "is not valid if product_count more than 4 digits" do
    subject.product_count="12345"
    expect(subject).to_not be_valid
  end
  it "is not valid without a customer" do
    subject.customer_id =  nil
    expect(subject).to_not be_valid
  end  
end
