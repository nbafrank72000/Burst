class UsersController < ApplicationController
	before_action :logged_in_user, only: [:show, :edit, :update, :destroy]
	before_action :correct_user, only: [:update]

	def new
		@user = User.new
	end

	def create
		@user = User.new(user_params)
  	if @user.save
  		log_in(@user)
  		flash[:success] = "Log in successfully"
  		redirect_to root_url
  	else
  		render 'new'
  	end
	end

	def edit
		@user = User.find(params[:id])
	end

	def update
		@user = User.find(params[:id])
    if @user.update_attributes(user_params)
      flash[:success] = "Profile updated"
      redirect_to @user
    else
      render 'edit'
    end
	end

	def show
		@user = User.find(params[:id])
	end

	def destroy
		
	end

	private

	def user_params
		params.require(:user).permit(:name, :email, :password, :password_confirmation)
	end

	def correct_user
    @user = User.find(params[:id])
    redirect_to(root_url) unless @user == current_user
  end

end