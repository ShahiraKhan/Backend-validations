class Order < ApplicationRecord
  belongs_to :customer
  validates_associated :customer
  validates_presence_of :customer
  validates :customer_id, presence: true
  validates :product_name, presence: true
  validates :product_count, presence: true
  validates :product_count, numericality: {only_integer: true}
  validates :product_count, length: {maximum: 4}
  #custom method
  validate :product_count_cannot_be_equal_to_zero
  def product_count_cannot_be_equal_to_zero
    if  product_count == 0
      errors.add(:product_count, "product_count cannot be equal to zero")
    end  
  end 
end
