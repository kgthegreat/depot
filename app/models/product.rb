class Product < ActiveRecord::Base
  has_many :line_items

  validates_presence_of :title , :description, :image_url
  validates_numericality_of :price
  validate :price_must_be_greater_than_zero
  validates_uniqueness_of :title
  validates_format_of :image_url,
                      :with => %r{\.(gif|png|jpg)$}i,
                      :message => 'must be a url for png, gif or jpg'

  def self.find_products_for_sale
    find(:all, :order => :title)
  end

  protected
  def price_must_be_greater_than_zero
    errors.add(:price ,'Should be atleast 0.01') if price.nil? ||
      price < 0.01
  end


end
