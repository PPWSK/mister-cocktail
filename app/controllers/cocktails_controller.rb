class CocktailsController < ApplicationController
  before_action :find_doses

  def index         # GET /restaurants
    @cocktails = Cocktail.all
  end

  def show          # GET /restaurants/:id
    @cocktail = Cocktail.find(params[:id])
  end

  def new           # GET /restaurants/new
    @cocktail = Cocktail.new
  end

  def create        # POST /restaurants
    @cocktail = Cocktail.new(cocktail_params)
    if @cocktail.save
      redirect_to cocktail_path(@cocktail)
    else
      render :new
    end
  end

  def edit          # GET /restaurants/:id/edit
    @cocktail = Cocktail.find(params[:id])
  end

  def update        # PATCH /restaurants/:id
    if @cocktail.update(cocktail_params)
      redirect_to cocktail_path(@cocktail)
    else
      render :edit
    end
  end

  def destroy       # DELETE /restaurants/:id
    @cocktail = Cocktail.find(params[:id])
    @cocktail.destroy

    redirect_to cocktail_path
  end

  private

  def cocktail_params
    params.require(:cocktail).permit(:name)
  end

  def find_doses
    @doses = Dose.all
  end
end
