Rails.application.routes.draw do
	#pages static
	root 'static_pages#index'
	get '/team', to: 'static_pages#team'
  get '/contact', to: 'static_pages#contact'
  #resources REST
	resources :gossips do
  	resources :comments
	end
	resources :users
	resources :cities
	resources :session, only: [:new, :create, :destroy]
	resources :likes, only: [:create, :destroy]
  get '/welcome/:first_name', to: 'users#welcome', as: 'welcome'
  #get 'profile/:user_id', to: 'users#profile', as: 'profile'
  #get '/gossip/:gossip_id', to: 'gossips#each_gossip', as: 'gossip' => relique d'un ancien monde
end
