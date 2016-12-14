class ArticlesController < ApplicationController
	
	before_action :set_article, only:[:show, :edit, :update, :destroy]
	before_action :require_user, except:[:index, :show]
	before_action :require_same_user, only:[:edit, :update, :destroy]


	def index
		@articles = Article.paginate(page: params[:page], per_page: 5)
			
			@hash = Gmaps4rails.build_markers(@articles) do |article, marker|
  			if article.latitude != "nil"
  			marker.lat article.latitude
  			marker.lng article.longitude
  			else
  			@hash = {"latitude"=> 44.000000 , "longitude"=> -5.000000}		
  			end
  			end
	end

	def new
	@article = Article.new	
	end

	def create
	    @article = Article.new(article_params)
	    @article.user = current_user
	    if @article.save
	    flash[:notice] = "Article was saved"
	    redirect_to article_path(@article)	
    	else
    		render 'new'
    	end
    end	


    def show
    	@hash = Gmaps4rails.build_markers(@articles) do |article, marker|
  			marker.lat article.latitude
  			marker.lng article.longitude
  		end
     end


	def edit
		
	end


   	def update
		if @article.update(article_params)
		flash[:notice] = "Article was successfully updated"
		redirect_to article_path(@article)
			else
			render 'edit'
		end
	end

	def destroy
		@article.destroy
		flash[:notice] = "Article was deleted"
		redirect_to articles_path
	end

private
	def set_article
		@article = Article.find(params[:id])
	end

	def article_params
      params.require(:article).permit(:title, :architect, :description)
 	end	

 	def require_same_user
 		if current_user != @article.user and !current_user.admin?
 		flash[:danger] = "You can only modify your own articles"
		redirect_to articles_path
 	end
 end	

end
