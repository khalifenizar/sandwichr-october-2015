class IngredientsController < ApplicationController
  def create
    my_sandwich = Sandwich.find_by(id: params[:sandwich_id])

    if my_sandwich.nil?
      error = { error: "Sandwich not found" }
      render json: error, status: 404
    else
      my_ingredient = my_sandwich.ingredients.create(ingredient_params)
      render json: my_ingredient
    end

  end

  def destroy
    my_sandwich = Sandwich.find_by(id: params[:sandwich_id])

    if my_sandwich.nil?
      error = { error: "Sandwich not found" }
      render json: error, status: 404
    else
      my_ingredient = my_sandwich.ingredients.find_by(id: params[:id])

      if my_ingredient.nil?
        error = { error: "Ingredient not found" }
        render json: error, status: 404
      else
        my_ingredient.destroy

        render json: my_ingredient
      end
    end
  end

  def show
    my_sandwich = Sandwich.find_by(id: params[:sandwich_id])

    if my_sandwich.nil?
      error = { error: "Sandwich not found" }
      render json: error, status: 404
    else
      my_ingredient = my_sandwich.ingredients.find_by(id: params[:id])

      if my_ingredient.nil?
        error = { error: "Ingredient not found" }
        render json: error, status: 404
      else
        render json: my_ingredient
      end
    end
  end


  private

  def ingredient_params
    params.require(:ingredient).permit(:name, :calories)
  end
end
