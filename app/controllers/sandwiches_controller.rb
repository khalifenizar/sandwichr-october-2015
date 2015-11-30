class SandwichesController < ApplicationController
  def index
    sandwiches = Sandwich.all
    render json: sandwiches
  end

  def create
    my_sandwich = Sandwich.create(sandwich_params)
    render json: my_sandwich
  end

  def show
    my_sandwich = Sandwich.find_by(id: params[:id])

    if my_sandwich.nil?
      error = { :error => "Sandwich not found" }

      render json: error, status: 404
    else
      render json: my_sandwich
    end
  end


  private

  def sandwich_params
    params.require(:sandwich).permit(:name, :bread_type)
  end
end
