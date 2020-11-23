class ShoppingcartsController < ApplicationController
  before_action :authorized, only: [:add, :show, :complete, :destroy]
  before_action :get_or_create_shopping_cart, except: [:completed]
  before_action :set_product, only: [:add, :destroy]

  skip_before_action :verify_authenticity_token  

  def create

  end
  
  def show
  end

  def complete
    @shopping_cart.completed!
    redirect_to completed_shoppingcart_path(@shopping_cart)
  end
  
  def completed
    @shopping_cart = ShoppingCart.find params[:id]
  end

  def add
    return redirect_to shopping_cart_path, notice: "Sin productos en existencia" unless @product.is_valid_to_add?

    @shopping_cart_product = ShoppingCartProduct.find_or_create_by(product:@product, shopping_cart:@shopping_cart) do |p|
      p.quantity = params[:quantity]
    end

    @shopping_cart.calculate_total
    redirect_to shopping_cart_path
  end

  def destroy
    @shopping_cart_product = ShoppingCartProduct.find_or_create_by(product:@product, shopping_cart:@shopping_cart)
    @shopping_cart_product.delete

    @shopping_cart.calculate_total
    redirect_to shopping_cart_path
  end

  private
    def get_or_create_shopping_cart
      @shopping_cart = ShoppingCart.where(id: session[:shopping_cart_id], status:'IN_PROGRESS').first

      unless @shopping_cart
        @shopping_cart = ShoppingCart.create user:current_user
        session[:shopping_cart_id] = @shopping_cart.id 
      end

    end

    def set_product
      @product = Product.find params[:product_id]
    end

end
