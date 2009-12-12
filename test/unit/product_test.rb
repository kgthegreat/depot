require 'test_helper'

class ProductTest < ActiveSupport::TestCase

  fixtures :products

  test "invalid with empty attributes" do
    product = Product.new
    assert !product.valid?
    assert product.errors.invalid?(:title)
    assert product.errors.invalid?(:description)
    assert product.errors.invalid?(:price)
    assert product.errors.invalid?(:image_url)
  end


  test "positive price" do
    product = Product.new(:title => "yes",
                          :description => "yes",
                          :image_url => "yes.jpg")

    product.price = -1
    assert !product.valid?
    assert_equal "Should be atleast 0.01", product.errors.on(:price)

    product.price = 0
    assert !product.valid?
    assert_equal "Should be atleast 0.01", product.errors.on(:price)

    product.price =
    assert !product.valid?
    assert_equal "Should be atleast 0.01", product.errors.on(:price)
  end

  test "unique title" do
    product = Product.new(:title => products(:fools_die).title ,
                          :description => "xyz",
                          :price => 1,
                          :image_url => "abc.gif")

    assert !product.save
    assert_equal I18n.translate("activerecord.errors.messages.taken"), product.errors.on(:title)
  end

  test "Can create valid product from fixture" do
    product = products(:fools_die)
    assert product.save
  end


end
