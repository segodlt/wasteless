class GroceriesController < ApplicationController
	def index
    @groceries = policy_scope(Grocery).where(user_id:current_user.id)
  end

 #  def create
 #  	@measure = Measure.find(params[:measure])
 #  	@user = current_user
 #  	@grocery = Grocery.new(measure: @measure, user: @user)
 #    authorize @grocery
 #  	@grocery.save
 #  	redirect_to recipe_path(@recipe), notice: "Vous avez rajouté #{@grocery.measure.ingredient.name} à votre liste de course."
 #  end

 #  def destroy
 #  	@grocery = Grocery.find(params[:id])
 #    authorize @grocery
 #    @grocery.destroy
 #  	redirect_to recipe_path(@grocery.measure.recipe), notice: "Vous avez supprimé #{@grocery.measure.ingredient.name} à votre liste de course."
 #  end
end
