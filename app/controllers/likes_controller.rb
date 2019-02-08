class LikesController < ApplicationController
	before_action :authenticate_user
	def create
		@user = current_user
		@like = Like.new(user: @user, likeable_type: params[:likeable_type], likeable_id: params[:likeable_id])
		if @like.save
			flash[:success] = "I think I like it!"
			redirect_to root_path
		else
			flash.now[:danger] = "No, no, no !"
			redirect_to root_path
		end
	end
	def destroy
		@like = Like.find_by(user: current_user, likeable_type: params[:likeable_type], likeable_id: params[:likeable_id])
    @like.destroy
    redirect_to root_path
	end

	private

	def authenticate_user
    unless current_user
      flash[:danger] = "Please log in. Motherfucker"
      redirect_to new_session_path
    end
  end
end
