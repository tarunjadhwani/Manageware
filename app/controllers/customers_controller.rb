class CustomersController < ApplicationController
	before_action :signed_in_user, only: [:index, :edit, :update]
	
	def new
		@customer = Customer.new
	end

	def create
		@customer = Customer.new(customer_params)
		if @customer.save
		    @customer.create_work_order if @customer.work_order.nil?
			redirect_to customers_path #will be changed to customer path
			flash[:success] = "Customer created!"
		else
			render 'new'
		end
	end

	def edit
      @customer = Customer.find(params[:id]) 
    end 

    def update
      @customer = Customer.find(params[:id])
      if @customer.update(customer_params)
        flash[:success] = "Profile updated successfully"
        sign_in @user
        redirect_to @user
      else
         flash.now[:error] = "Cannot update your profile"
         render 'edit'
      end
    end

	def show
		@customer = Customer.find(params[:id])
	end

	def index
		@customer = Customer.all.search(params[:search]).paginate(:per_page => 10, :page => params[:page])
	end

	def destroy 
		@customer = Customer.find(params[:id])
		@customer.destroy
		redirect_to customers_path
	end

	def customer_params
		params.require(:customer).permit(:name, :company, work_order_attributes: [:area, :id])
	end
end
