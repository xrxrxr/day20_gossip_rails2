class UsersController < ApplicationController
  def welcome
  	@user = User.find_by(first_name: params[:first_name])
  	#puts "Ceci est mon premier user : #{@user}"
  	#puts params
  end
  def profile
  	@user = User.find_by(id: params[:user_id])
  	#puts "Ceci est mon premier user : #{@user}"
  	#puts params
  end
end
