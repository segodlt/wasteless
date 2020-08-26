class ReviewsController < ApplicationController
	
	def new
    @recipe = Recipe.find(params[:recipe_id])
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    @recipe = Recipe.find(params[:recipe_id])
    @review.user = current_user
    @review.recipe = @recipe
    if @review.save
      redirect_to recipe_path(@recipe)
    else
      render "recipes/show"
    end
  end

  def edit
    @review = Review.find(params[:id])
    @recipe = @review.recipe
    render "recipes/show"
  end

  def update
    @review = Review.find(params[:id])
    @recipe = @review.recipe
    @review.update(review_params)
    redirect_to recipe_path(@recipe)
  end  

  def destroy
    @review = Review.find(params[:id])
    @review.destroy
    redirect_to recipe_path(@review.recipe)
  end

  private

  def review_params
    params.require(:review).permit(:rating, :content)
  end
end
