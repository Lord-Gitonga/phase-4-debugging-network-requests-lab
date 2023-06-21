class ToysController < ApplicationController
  wrap_parameters format: []
rescue_from ActiveRecord::RecordNotFound, with: :render_not_found
  def index
    toys = Toy.all
    render json: toys
  end

  def create
    toy = Toy.create(toy_params)
    render json: toy, status: :created
  end

  def show
    toys = toy_find
    render json: toys
  end

  def update
    toys = toy_find
    toys.update(toy_params)
  end

  def destroy
    toys = toy_find
    toys.destroy
    head :no_content
  end

  private
  
  def toy_params
    params.permit(:name, :image, :likes)
  end

  def toy_find
    Toy.find(params[:id])
  end

  def render_not_found
    render json: {error: "Toy not found"}, status: :not_found
  end
end
