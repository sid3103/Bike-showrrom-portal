class CartsController < ApplicationController

	def index
		@cart = current_user.cart
    @users = User.all
	end

  def create
  	if current_user.present?
  		@cart = current_cart(current_user)
  		if @cart.cart_items.find_by_two_wheeler_id(params[:bike_id]).blank?
  			@cart_items = @cart.cart_items.new(two_wheeler_id: params[:bike_id])
  			if @cart_items.save
  				@message = "Item Added Successfully"
  			end
  		else
  			@message = "Item already present"
  		end
  		respond_to do |format|
  			format.js{}
  		end
  	else
  		redirect_to :user_sign_in_path, flash[:notice] = 'Please login first'
  	end
    @purchased_products = current_user.try(:cart).try(:cart_items) || []
  end

  def destroy
  @cartitem = CartItem.find(params[:id])
    if @cartitem.destroy
      flash[:notice] = "Product deleted"
      redirect_to root_path
    else
      flash[:alert] = "Error deleting product!"
    end
  end
end
