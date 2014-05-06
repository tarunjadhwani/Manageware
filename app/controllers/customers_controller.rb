class CustomersController < ApplicationController
	before_action :signed_in_user, only: [:index, :edit, :update]
	layout "report_format", only: :report
	
	def new
		@customer = Customer.new
		respond_to do |format|
	      format.html
	      format.js
	    end
	end

	def create
		@customer = Customer.new(customer_params)
		if @customer.save
		    @customer.create_work_order if @customer.work_order.nil?
			redirect_to customers_path
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
		@customer = Customer.all.search(params[:search]).paginate(:per_page => 8, :page => params[:page])
	end

	def report
		@customer = Customer.all
		respond_to do |format|
	        format.html
	        format.pdf do
	          render :pdf => "Customer Report",
	          :template => "/customers/report.html.erb",
	          :disposition => "attachment",
	          :filename => "Customer Report"
	        #  :save_to_file => Rails.root.join('pdfs', "#{@formdetail.id}.pdf")
	        end
	    end
	end

	#def download
	#	@customer = Customer.all
	#	send_file '/customer_report.pdf', :type=>"application/pdf" 
	#end

	def destroy 
		@customer = Customer.find(params[:id])
		@customer.destroy
		flash[:success] = "Customer Deleted successfully"
		redirect_to customers_path
	end

	def customer_params
		params.require(:customer).permit(:name, :company, work_order_attributes: [:area, :id])
	end
end
