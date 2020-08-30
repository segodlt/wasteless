class MeasuresController < ApplicationController
  def new
    @recipe = Recipe.find(params[:recipe_id])
    @measure = Measure.new
    authorize @measure
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

  def update
     @recipe = Recipe.find(params[:recipe_id])
     @measure = Measure.find(params[:id])
     authorize @measure
     @measure.update(new_params)
     @measure.recipe = @recipe
     redirect_to recipe_path(@recipe)
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
    params.require(:measure).permit(:id, :quantity, :listed, :required, :ingredient_id)
  end
end
