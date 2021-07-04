class UsersController < ApplicationController
	
	def index
		@users = User.all 
		render json: @users
	end

	def create
		@user =  User.create(user_params)
		if @user.save
			render json: @user, status: :created
		else
			render json: @user.error, status: :unprocessable_entity
		end
	end

	def show
		@user = User.find(params[:id])
		render json: @user
	end

	def edit
		@user = User.find(params[:id]) 
	end

	def update
		@user = User.find(params[:id])
		if @user.update(user_params)
			render json: @user
		else
			#render json: @user.error, status: :unprocessable_entity
		end
	end

	def destroy
		@user = User.find(params[:id])
		@user.destroy
	end

	private

	def user_params
		params.permit(:name, :email, :phone, :address)
	end

end
