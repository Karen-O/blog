class CommentsController < ApplicationController   # '<' = class inherits functionalities from

# No 'index' or 'show' for comments

	def new    #GET
		@post = Post.find(params[:post_id])
		@comment = Comment.new
	end

	def create
		@post = Post.find(params[:post_id])
		@comment = Comment.new(comment_params)
		if @comment.save
			redirect_to(@post)
		else
			render(:new)
		end
	end

	def edit    #GET
		@post = Post.find(params[:post_id])
		@comment = Comment.find(params[:id])
	end

	def update
		@post = Post.find(params[:post_id])

		@comment = Comment.find(params[:id])
		if @post.update( post_params )
			redirect_to(@post)
		else
			render(:edit)
		end
	end

	def destroy
		@post = Post.find(params[:post_id])
		@comment.destroy
		redirect_to(posts_path)
	end

end