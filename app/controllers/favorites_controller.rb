class FavoritesController < ApplicationController
	def index
    @favorites = policy_scope(Favorite).where(user_id:current_user.id)
  end

  def create
  	@recipe = Recipe.find(params[:recipe])
  	@user = current_user
  	@favorite = Favorite.new(recipe: @recipe, user: @user)
    authorize @favorite
  	@favorite.save
  	redirect_back(fallback_location: recipe_path(@recipe), notice: "Vous avez rajouté #{@recipe.title} à vos favoris.")
  end

  def destroy
  	@favorite = Favorite.find(params[:id])
    authorize @favorite
    @favorite.destroy
  	redirect_back(fallback_location: recipe_path(@favorite.recipe), notice: "Vous avez supprimé #{@favorite.recipe.title} de vos favoris.")
  end

  def favorite_params
    params.require(:favorite).permit(:id)
  end
end
