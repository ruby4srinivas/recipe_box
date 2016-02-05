class RecipesController < ApplicationController
before_action :find_recipe, only: [:show, :update,  :edit, :destroy]

  def index

   @recipe = Recipe.all.order('created_at desc').where.not(title: nil)

    end

  def show

  end

  def new
    @recipe = Recipe.new
  end

  def create
    @recipe = Recipe.new(recipe_params)
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

  private

  def find_recipe
    @recipe = Recipe.find(params[:id])
  end

  def recipe_params
    params.require(:recipe).permit(:title, :description, :image,
                         ingredients_attributes: [:id, :name, :_destroy],
                         directions_attributes: [:id, :step, :_destroy] )
  end
end
