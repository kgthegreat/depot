class StoreController < ApplicationController
  @counter = 0
  def index
    @products = Product.find_products_for_sale
    @cart = find_cart
    if session[:counter].nil?
      session[:counter] = 1
    else
      session[:counter] += 1
      @counter = session[:counter]
    end
  end

  def add_to_cart
    product = Product.find(params[:id])
    @cart = find_cart
    @current_item = @cart.add_product(product)
    respond_to do |format|
      format.js if request.xhr?
      format.html { redirect_to_index}
    end
  rescue ActiveRecord::RecordNotFound
    logger.error("attempt to access invalid product #{params[id]}")
    redirect_to_index "Invalid Product"
  end

  def empty_cart
    session[:cart] = nil
    redirect_to_index
  end

  def checkout
    @cart = find_cart
    if @cart.items.empty?
      redirect_to_index("Your cart is empty")
    else
      @order = Order.new
    end

    redirect_to( :action => 'checkout')
  end


private

  def find_cart
    session[:cart] ||= Cart.new
  end

  def redirect_to_index(msg = nil)
    flash[:notice] = msg
    redirect_to :action => 'index'
  end


end
