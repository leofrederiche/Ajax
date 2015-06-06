class UserController < ApplicationController

	def new
		@user = User.new
	end

	def create
		user = User.create(user_params)

		if user.save
			redirect_to root_path
		else
			render :new
		end
	end

	def destroy
		user = User.find params[:id]
		user.delete

		respond_to do |format|
			format.html { redirect_to root_path }
		    format.json { head :no_content }
		    format.js   { render :layout => false }
		end
	end

	private
	def user_params
		params.require(:user).permit(:name)
	end

end