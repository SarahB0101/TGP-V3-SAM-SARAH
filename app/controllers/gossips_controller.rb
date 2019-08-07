class GossipsController < ApplicationController
  def show
  	@id = params[:id]
  	@gossip = Gossip.all.find(@id)
  	# @user = User.all.find(@id)
  	
  end


  def new
  	@gossip = Gossip.new
  end



  def create
  	@gossip = Gossip.new(title: params[:title], content: params[:content], user: User.last)
  	
  	if @gossip.save
  		flash[:success] = "Ton gossip est bien enregistré !"
  		redirect_to index_path
  	else
  		#flash = {error: "Ton gossip n'a pas été enregistré, recommence..."}
  		render new_gossip_path	
  	end

  end




end
