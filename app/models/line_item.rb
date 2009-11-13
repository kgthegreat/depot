class LineItem < ActiveRecord::Base
  belong_to :product
  belong_to :order
end
