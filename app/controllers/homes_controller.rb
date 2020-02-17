class HomesController < ApplicationController
  def index
  	@two_wheelers = TwoWheeler.all
  	@cart = current_user.cart
  end

end
