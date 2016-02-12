class RecipesController < ApplicationController
  before_action :find_recipe, only: [:show, :update,  :edit, :destroy]
  before_action :authenticate_user!, except:[:index, :show,:search]

  def index
#for simple search
#@recipe ||= Recipe.simple_search(params[:query])

#for solr  it will search any matching word in Recipes , ingredients and directions.
# as well at the top shows the facets

@search = Recipe.search do
  fulltext params[:query]
  facet(:publish_month)
  with(:publish_month, params[:month]) if params[:month].present?
end
@recipe = @search.results
# end of solr

# elastic search

#@recipe = Recipe.search(params)


  end

  def show

  end

  def new
    @recipe = current_user.recipes.build  #
    #@recipe = Recipe.new
  end

  def create
    @recipe = current_user.recipes.build(recipe_params)
    #@recipe = Recipe.new(recipe_params)
    if @recipe.save
      redirect_to @recipe, notice: ' successfully new receipe createe'
    else
      render new
    end

  end

  def edit

  end
  def update
    if @recipe.update(recipe_params)
      redirect_to @recipe
    else
      render 'edit'
    end
  end

  def destroy
    @recipe.destroy
    redirect_to root_path, notice: 'successfully deleted'
  end

  # def search
  #   if params[:search]
  #     # @search = Recipe.search(params[:query])
  #     # @query = @search.all
  #     @recipe = Recipe.where('lower(title) like ?', "%#{params[:query].downcase}%")
  #     render 'index'
  #     # else
  #     #   render 'index'
  #   end
  # end
  private

  def find_recipe
    @recipe = Recipe.find(params[:id])
  end

  def recipe_params
    params.require(:recipe).permit(:title, :description, :image, :delete_image,
                                   ingredients_attributes: [:id, :name, :_destroy],
                                   directions_attributes: [:id, :step, :_destroy] )
  end
end
