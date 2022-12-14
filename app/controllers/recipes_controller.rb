class RecipesController < ApplicationController
  before_action :find_recipe, only:[:show, :edit, :update, :destroy]

  def index
    @recipes = Recipe.order(id: :desc)
    @recipes = Recipe.where('title like ?', "%#{params[:keyword]}%").order(id: :desc) if params[:keyword]
 
  end

  def new
    @recipe = Recipe.new
  end

  def create
    @recipe = Recipe.new(recipe_params)
    if @recipe.save
      redirect_to recipes_path, notice: "Recipe successfully created"
    else
      render 'new'
    end
  end

  def show
  end
  
  def edit
  end

  def update
    if @recipe.update(recipe_params)
      redirect_to recipes_path, notice: "Recipe successfully updated"
    else
      render 'edit'
    end
  end

  def destroy
    @recipe.destroy
    redirect_to recipes_path, notice: "Recipe successfully deleted"
  end
  
  private
  def recipe_params
    params.require(:recipe).permit(:title, :portion, :time, :ingredient, :content)
  end

  def find_recipe
    @recipe = Recipe.find(params[:id])
  end
  
end
