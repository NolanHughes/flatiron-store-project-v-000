class Cart < ActiveRecord::Base
  belongs_to :user
  has_many :line_items
  has_many :items, :through => :line_items

  def total
    line_items.map do |line_item|
      line_item.item.price * line_item.quantity # Dumb. Price won't be right now
    end.sum
  end

  def add_item(item_id)
    if line_item = line_items.find_by(item_id: item_id)
      line_item.update(quantity: (line_item.quantity + 1) )
      line_item
    else
      line_items.new(item_id: item_id)
    end
  end



end
