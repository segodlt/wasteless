class GroceriesController < ApplicationController
	def index
    @groceries = policy_scope(Grocery).where(user_id:current_user.id)
  end


  def create
    @user = current_user
    @recipe = Recipe.find(params[:recipe])
  	@measure = Measure.find(params[:measure_id])
    @grocery = Grocery.new(grocery_params)
    authorize @grocery
    @grocery.save
    redirect_to recipe_path(@recipe), notice: "Vous avez rajouté #{@grocery.measure.ingredient.name} à votre liste de course."
  end

  def destroy
  	@grocery = Grocery.find(params[:id])
    authorize @grocery
    @grocery.destroy
  	redirect_to recipe_path(@grocery.measure.recipe), notice: "Vous avez supprimé #{@grocery.measure.ingredient.name} à votre liste de course."
  end

  private
  def grocery_params
    params.require(:grocery).permit(measures_attributes: [:id, :ingredient_id, :listed, :quantity, :required])

  end
end
