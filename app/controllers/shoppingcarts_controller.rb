class ShoppingcartsController < ApplicationController
  before_action :authorized, only: [:add, :show]
  before_action :get_or_create_shopping_cart

  skip_before_action :verify_authenticity_token  

  def create

  end
  
  def show

  end

  def add
    @product = Product.find params[:product_id]

    @shopping_cart_product = ShoppingCartProduct.find_or_create_by(product:@product, shopping_cart:@shopping_cart) do |p|
      p.quantity = params[:quantity]
    end

    redirect_to shopping_cart_path
  end

  def get_or_create_shopping_cart
    
    if session[:shopping_cart_id]
      @shopping_cart = ShoppingCart.find session[:shopping_cart_id]
    else
      @shopping_cart = ShoppingCart.create user:current_user
      session[:shopping_cart_id] = @shopping_cart.id
    end

  end


end
