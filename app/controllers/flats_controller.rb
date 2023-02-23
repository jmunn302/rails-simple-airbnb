class FlatsController < ApplicationController
  before_action :set_flat, only: %i[ show edit update destroy]


  def index
    @flats = Flat.all
  end

  def show
  end

  def new
    @flat = Flat.new
  end

  def edit
  end

  def create
    @flat = Restaurant.new(flat_params)

    if @flat.save
      redirect_to @flat, notice: "Flat was successfully added."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @flat.update(flat_params)
      redirect_to @flat, notice: "Flat was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @flat.destroy
    redirect_to flats_url, notice: "Flat was successfully removed."
  end

  private
    def set_flat
      @flat = Flat.find(params[:id])
    end

    def flat_params
      params.require(:flat).permit(:name, :address, :description, :price_per_night, :number_of_guest)
    end
end

