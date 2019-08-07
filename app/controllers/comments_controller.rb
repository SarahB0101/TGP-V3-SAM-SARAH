class CommentsController < ApplicationController
	def new
		@comment = Comment.new
	end

	def create
		@comment = Comment.new(params[:comment])
		@gossip = Gossip.new(title: params[:title], content: params[:content], user: User.last)

	end

	def edit
		
	end

	def update
		
	end

	def destroy
		
	end
end
