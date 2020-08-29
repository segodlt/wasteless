class MeasuresController < ApplicationController
  def new
    @recipe = Recipe.find(params[:recipe_id])
    @measure = Measure.new
    authorize @measure
  end

  def listed?
    @measure = Measure.find(params[:id])
    @measure.listed = true
    @measure.save
  end

  def create
    @recipe = Recipe.find(params[:recipe_id])
    @measure = Measure.new(measure_params)
    @measure.recipe = @recipe
    authorize @measure
    if @measure.save
      redirect_to recipe_path(@recipe)
    else
      render :new
    end
  end

  def destroy
    @recipe = Recipe.find(params[:recipe_id])
    @measure = Measure.find(params[:id])
    authorize @measure
    @measure.destroy
    redirect_to recipe_path(@recipe)
  end

  private
  def measure_params
    params.require(:measure).permit(:quantity, :listed, :required, :ingredient_id)
  end
end
