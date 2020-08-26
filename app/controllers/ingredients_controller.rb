class IngredientsController < ApplicationController
  def index
    @ingredients = policy_scope(Ingredient).order(created_at: :desc)
  end

  # def show
  #   @ingredient = Ingredient.find(params[:id])
  # end
end
