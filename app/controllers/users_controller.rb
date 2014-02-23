class UsersController < ApplicationController
  before_action :signed_in_user, only: [:index, :edit, :update]
  before_action :correct_user,   only: [:edit, :update]

  def new
  	@user = User.new
  end

  def create
  	@user = User.new(user_params)
  	if @user.save
  		sign_in @user
      redirect_to customers_path
  		flash[:success] = "User created successfully"
  	else
  		render 'new'
  	end	
  end

  def index
    @users = User.all
  end

  private

  def user_params
  	params.require(:user).permit(:name, :email, :password, :password_confirmation)	
  end
end
