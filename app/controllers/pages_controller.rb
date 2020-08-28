class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home, :dashboard]

  def home
    @category = Category.find(category_id:params[:category_id])
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

    if params[:category_id].present?
      @recipes = Recipe.where(category_id:params[:category_id])
    end
  end

  def dashboard
    @user = current_user
  end

  def account
    @user = current_user
  end
end
