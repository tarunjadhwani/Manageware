class CustomersController < ApplicationController
	before_action :signed_in_user, only: [:index, :edit, :update]
	
	def new
		@customer = Customer.new
	end

	def create
		@customer = Customer.new(customer_params)
		if @customer.save
			redirect_to customers_path #will be changed to customer path
			flash[:success] = "Customer created!"
		else
			render 'new'
		end
	end

	def show
		@customer = Customer.find(params[:id])
	end

	def index
		@customer = Customer.all
	end

	def destroy
		@customer.destroy
		redirect_to root_url
	end

	def customer_params
		params.require(:customer).permit(:name, :company)
	end
end
