class GossipsController < ApplicationController
  def each_gossip
  	@gossip = Gossip.find_by(id: params[:gossip_id])
  	@author = @gossip.user
  	@first_name = @author.first_name
  end
end
