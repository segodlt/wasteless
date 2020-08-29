class RecipesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

	def index
    @recipes = policy_scope(Recipe).order(created_at: :desc)
  end

  def show
    @recipe = Recipe.find(params[:id])
    @favorite = @recipe.favorites.where(user_id:current_user.id).first if user_signed_in?
    authorize @recipe

    @review = Review.new if user_signed_in?
  end

  def new
    @recipe = Recipe.new
    @recipe.measures.build
    authorize @recipe
  end

  def create
    new_params = recipe_params
    new_params[:measures_attributes].delete("0")

    @recipe = Recipe.new(new_params)
    @recipe.user = current_user
    authorize @recipe
    if @recipe.save
      redirect_to recipe_path(@recipe)
    else
      render :new
    end
  end

  def edit
    @recipe = Recipe.find(params[:id])
    authorize @recipe
  end

  def update
    new_params = recipe_params
    new_params[:measures_attributes].delete("0")

    @recipe = Recipe.find(params[:id])
    authorize @recipe
    @recipe.update(new_params)
    redirect_to recipe_path(@recipe)
  end

  def destroy
    @recipe = Recipe.find(params[:id])
    authorize @recipe
    @recipe.destroy
    redirect_to recipes_path
  end

  private

  def recipe_params
    params.require(:recipe).permit(:title, :description, :category_id, photos: [], measures_attributes: [:id, :ingredient_id, :quantity, :required])
  end
end
