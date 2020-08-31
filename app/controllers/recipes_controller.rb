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
    # new_params[:measures_attributes].delete("0")
    @recipe = Recipe.find(params[:id])
    authorize @recipe
    @recipe.update(new_params)

    # Créer les nouvelles mesures avec les params
    new_measure_params = params.select{ |p| p.include?('new_measure_id') }
    new_measure_params.each do |new_measure_param|
      new_measure = Measure.new
      new_measure.recipe = @recipe
      new_measure.ingredient_id = new_measure_param[1]

      new_measure_number = new_measure_param[0].split('_').last
      new_measure.quantity = params["new_measure_quantity_#{new_measure_number}"]

      params_required = params["new_measure_required_#{new_measure_number}"]
      if params_required
        new_measure.required = true
      else
        new_measure.required = false
      end
      new_measure.save
    end

    #@recipe.measures.build
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
    params.require(:recipe).permit(:title, :description, :category_id, photos: [], measures_attributes: [:id, :ingredient_id, :listed, :quantity, :required])
  end
end
