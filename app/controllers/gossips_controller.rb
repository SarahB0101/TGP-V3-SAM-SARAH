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
  		#flash[:error]= "Ton gossip n'a pas été enregistré, recommence..."
  		render new_gossip_path	
  	end

  end

  def edit
      @id = params[:id]
      @gossip = Gossip.all.find(@id)
  end


  def update
    @gossip = Gossip.find(params[:id])
    if @gossip.update(title: params[:title], content: params[:content], user: User.last)
      flash[:success] = "Ton gossip est bien modifié !"
      redirect_to gossip_path
     else
     render :edit 
    end
    
  end

  def destroy
     

      @gossip = Gossip.all.find(params[:id])
      @gossip.destroy
      
       if flash[:success1] = "Ton gossip a bien été supprimé !"
      redirect_to index_path
      else
      render gossip_path

      end
  end


end
