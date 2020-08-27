class PagesController < ApplicationController
  def home
  	if params[:query].present?
  		sql_query = " \
  		recipes.title ILIKE :query \
  		OR recipes.description ILIKE :query \
  		OR categories.name ILIKE :query \
  		OR ingredients.name ILIKE :query \
  		"
  		@recipes = Recipe.joins({measures: :ingredient}).joins(:category).where(sql_query, query:"%#{params[:query]}%")
    else
      @recipes = Recipe.all
    end
  end

  def dashboard
    @user = current_user
  end

  def account
    @user = current_user
  end
end
