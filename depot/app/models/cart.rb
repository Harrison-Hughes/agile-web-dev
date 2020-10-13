class Cart < ApplicationRecord
  has_many :line_items, dependent: :destroy

  def add_product(product)
    current_item = line_items.find_by(product_id: product.id)
    if current_item
      current_item.quantity += 1
    else 
      current_item = line_items.build(product_id: product.id)
    end
    current_item
  end

  def minus_one_product(product)
    current_item = line_items.find_by(product_id: product.id)
    print "\n CURRENT ITEM: #{current_item} \n"
    print "\n CURRENT ITEM QTY: #{current_item.quantity} \n"
    if current_item.quantity > 1
      current_item.quantity -= 1
    else 
      current_item.destroy
    end
    current_item
  end

  def total_price
    line_items.to_a.sum { |item| item.total_price}
  end
end
