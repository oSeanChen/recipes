class RecipesController < ApplicationController
  before_action :find_recipe, only:[:edit, :update, :destroy]

  def index
    @recipes = Recipe.all
  end

  def new
    @recipe = Recipe.new
  end

  def create
    @recipe = Recipe.new(recipe_params)
    if @recipe.save
      redirect_to recipes_path, notice:  "Recipe successfully created"
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @recipe.update(recipe_params)
      redirect_to recipes_path, notice:  "Recipe successfully updated"
    else
      render 'edit'
    end
  end

  def destroy
  end
  
  private
  def recipe_params
    params.require(:recipe).permit(:title, :portion, :time, :content)
  end

  def find_recipe
    @recipe = Recipe.find(params[:id])
  end


  
  
end
