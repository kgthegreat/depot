require 'test_helper'

class CartTest < ActiveSupport::TestCase
 fixtures :products

  def setup
    @cart = Cart.new
    @fools_die = products(:fools_die)
    @white_tiger = products(:white_tiger)
  end

  test "is able to add unique products" do

    @cart.add_product(@fools_die)
    @cart.add_product(@white_tiger)
    assert_equal @cart.total_items, 2
    assert_equal @cart.total_price, @fools_die.price + @white_tiger.price
  end

  test "adding the same product increases the product's quantity and not the number of items" do

    @cart.add_product(@fools_die)
    @cart.add_product(@fools_die)
    assert_equal 1 , @cart.items.size
    assert_equal 2 , @cart.items[0].quantity

  end
end
