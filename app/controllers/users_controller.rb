class UsersController < ApplicationController

	before_action :set_user, only: [:edit, :update, :show]
	before_action :require_same_user, only: [:edit, :update]

	def new
		@user = User.new
	end

	def create
		@user = User.new(user_params)
		if @user.save
	    flash[:notice] = "Welcome to the Glasgow Pevsner #{@user.username}"
	    redirect_to articles_path
    	else
    		render 'new'
    	end
	end

	def show
		
	end

	def index
		@users = User.paginate(page: params[:page], per_page: 5)
	end
	

	def edit
		
	end

	def update
		if @user.update(user_params)
		flash[:notice] = "User was successfully updated"
		redirect_to articles_path
		else
		render 'edit'
		end
	end


	private

	def set_user
		@user = User.find(params[:id])
		@user.ip_address = session[:ip_address]
		@location = session[:location]
	end
	
	def user_params
	params.require(:user).permit(:username, :email, :password)
	end

	def require_same_user
		if !logged_in? && current_user != @user
			flash[:danger] = "You can only edit your own account"
			redirect_to root_path
		end
	end

end
