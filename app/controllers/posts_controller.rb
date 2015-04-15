class PostsController < ApplicationController   # '<' = class inherits functionalities from

# instance variables ('@variables') are how Rails communicates from the controller(s) to the view.
# but only the 4 GET routes need corrsponding 'views' pages


	def index  #GET
		@posts = Post.all   # any variable prefixed with '@' is an INSTANCE VARIABLE, meaning that in the CLASS within which it is defined (here, PostsController), it will "work"/exist/be usable within any & all other methods ALSO defined in that Class.
	end						# any variable that is set as equal to multiple values (aka, @posts and Post.all), you know that the variable is going to equal a collection (array or hash)
							# which MEANS! that you can perform methods that are meant for collections, on these Controller variables.
	def new  #GET
		@post = Post.new
	end

	def create
		@post = Post.new(post_params)
		if @post.save
			redirect_to(@post)
		else
			render(:new)
		end
	end

	def show  #GET
		@post = Post.find(params[:id])  # Show page is linked from the Index page, so that's where it gets the post ID from. (the post to "show" )
		@comments = @post.comments.all
	end

	def edit  #GET
		@post = Post.find(params[:id])   # We'll only ever be linking to the edit page from the show page or the index page, so that's where the post ID will come from.
	end

	def update
		@post = Post.find(params[:id])
		if @post.update( post_params )
			redirect_to(@post)
		else
			render(:edit)
		end
	end

	def destroy
		@post = Post.find(params[:id])
		@post.destroy
		redirect_to(posts_path)
	end

	private
	def post_params
		params.require(:post).permit(:title, :content)
	end
end