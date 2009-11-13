class AddTestData < ActiveRecord::Migration
  def self.up
    Product.delete_all
    Product.create(:title => 'The lord of the rings',
                   :description => %{ <p> Trilogy of the famous frodo baggins </p>},
                   :image_url => 'lor.jpg',
                   :price => 28.50 )
    Product.create(:title => 'English, August',
                   :description => %{ <p> Funniest book ever </p>},
                   :image_url => 'englishaugustbig.jpg',
                   :price => 23.50 )
    Product.create(:title => 'The hitchhiker\'s guide to the galaxy',
                   :description => %{ <p> The best travelogue ever </p>},
                   :image_url => 'hgg.jpg',
                   :price => 56.50 )
  end

  def self.down
    Product.delete_all
  end
end
