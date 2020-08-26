class MeasuresController < ApplicationController
  def new
    @recipe = Recipe.find(params[:recipe_id])
    @measure = Measure.new
  end

  def create
    @recipe = Recipe.find(params[:recipe_id])
    @measure = Measure.new(measure_params)
    @measure.recipe = @recipe
    if @measure.save
      redirect_to recipe_path(@recipe)
    else
      render :new
    end
  end

  private
  def measure_params
    params.require(:measure).permit(:quantity, :required, :ingredient_id)
  end
end
