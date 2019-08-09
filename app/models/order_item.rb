class OrderItem < ApplicationRecord
  belongs_to :product
  belongs_to :order
  validates :quantity, presence: true, numericality: {only_integer: true, greater_than: 0}
  validate :product_present
  validate :order_present

  before_save :finalize
  
  def unit_price
    if persisted
      self[:unit_price]
    else
      product.price
    end
  end

  def total_price
    unit_price * quantity
  end

  private
    def order_present
      if order.nil?
        errors.add(:order, "is not valid order.")
      end
    end

    def product_present
      if product.nil?
        errors.add(:product, "is not valid order.")
      end
    end
    def set_order_status
      self.status_id = 1
    end
    def finalize
      self[:unit_price] = unit_price
      self[:total_price] = quantity * self[:unit_price]
    end
end
