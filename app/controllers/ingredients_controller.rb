class IngredientsController < ApplicationController
  skip_after_action :verify_authorized, only: [:create_json]

  def index
    @ingredients = policy_scope(Ingredient).order(created_at: :desc)
  end

  def create_json
    @ingredients = policy_scope(Ingredient).order(created_at: :desc)
    render json: @ingredients
  end

  # def show
  #   @ingredient = Ingredient.find(params[:id])
  # end
end
