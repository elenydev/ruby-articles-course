class ArticlesController < ApplicationController
    def show
        @article = Article.find(params[:id])
    end

    def index
        @articles = Article.all
    end

    def new
        @article = Article.new
    end

    def create
        @article = Article.new(article_params)

        respond_to do |format|
            if @article.save
                format.html { redirect_to article_url(@article), notice: 'Article created succesfully' }
                format.json { render :show, status: :created , location: @article }
            else
                format.html { render :new, status: :unprocessable_entity }
                format.json { render json: @article.errors, status: :unprocessable_entity }
            end
        end
    end

    def destroy
        Article.destroy(params[:id])

        respond_to do |format|
            if Article.destroy(params[:id])
                format.html { redirect_to articles_url, notice: "Article destroyed"}
                format.json { head :no_content}
            else
                format.html { render :index, status: :unprocessable_entity }
                format.json { render json, status: :unprocessable_entity }
            end
        end
    end
    
    private
        def article_params
            params.require(:article).permit(:title, :description)
            
        end
end
