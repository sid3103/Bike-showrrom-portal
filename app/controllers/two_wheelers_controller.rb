class TwoWheelersController < ApplicationController
	def index
		@two_wheeler = TwoWheeler.all
	end

	def new
		@two_wheeler = TwoWheeler.new
	end

	def create
		@two_wheeler = TwoWheeler.new(two_wheeler_params)
		if @two_wheeler.save
			redirect_to root_path, notice: "two_wheeler added successfully"
		else
			render :new
		end
	end

	def destroy
		@two_wheeler = TwoWheeler.find(params[:id])
		if @two_wheeler.destroy
			redirect_to root_path
		else
			flash[:alert] = "Error deleting product!"
		end
	end
    
  def get_two_wheeler
  	@two_wheeler = TwoWheeler.find(params[:two_wheeler_id])
  	respond_to do |format|
  		format.js{}
  	end
  end

	private

	def two_wheeler_params
		params.require(:two_wheeler).permit(:title, :description, :specification, :price, :image)
	end
end
