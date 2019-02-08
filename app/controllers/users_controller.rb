class UsersController < ApplicationController
  def welcome
  	@user = User.find_by(first_name: params[:first_name])
  	#puts "Ceci est mon premier user : #{@user}"
  	#puts params
  end
  def show #ex-profile
  	@user = User.find(params[:id])
  	#puts "Ceci est mon premier user : #{@user}"
  	#puts params
  end
  def new
    @cities = City.all
    @user = User.new
  end
  def create
    @city = City.find(1)
    @user = User.new(first_name: params[:first_name], last_name: params[:last_name], description: params[:description], age: params[:age], email: params[:email], password: params[:password], city: @city)
    # on vérifie si l'utilisateur existe bien ET si on arrive à l'authentifier (méthode bcrypt) avec le mot de passe 
    if @user.save
      session[:user_id] = @user.id
      flash[:success] = 'Welcome Aboard'
      redirect_to root_path
      # redirige où tu veux, avec un flash ou pas
    else
      flash.now[:danger] = 'Tu veux vraiment faire partie de la familia ?'
      render 'new'
    end
  end
end
