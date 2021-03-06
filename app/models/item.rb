class Item < ActiveRecord::Base
  has_many :line_items
  belongs_to :category
  has_many :carts, through: :line_items

  def self.available_items
    all.select do |item|
      item.inventory > 0
    end
  end

  def price_as_decimal
    self.price.to_f/100
  end

end
