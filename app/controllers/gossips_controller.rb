class GossipsController < ApplicationController
	def index
	end
  def each_gossip
  	@gossip = Gossip.find_by(id: params[:gossip_id])
  	@author = @gossip.user
  	@first_name = @author.first_name
  end
  def new
  	@gossip = Gossip.new
  end
  def create
  	@gossip = Gossip.new('title' => params[:title], 'content' => params[:content], 'user' => User.find(11))
  	if @gossip.save # essaie de sauvegarder en base @gossip
  	  # si ça marche, il redirige vers la page d'index du site
  	  redirect_to root_path
  	else
  	  # sinon, il render la view new (qui est celle sur laquelle on est déjà)
  	  render 'new'
  	end
  end
end