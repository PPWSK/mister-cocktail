class DosesController < ApplicationController
  before_action :find_cocktail, only: [ :new, :create ]
  def new
    @dose = Dose.new
  end

  def show
    @doses = Dose.all
  end

  def create
    @dose = @cocktail.doses.build(dose_params)
    if @dose.save
      redirect_to cocktail_path(@cocktail), notice: 'Dose was succesfully build.'
    else
      render :new
    end
  end

  def destroy
    @dose = Dose.find(params[:id])
    @dose.destroy

    redirect_to cocktail_path, notice: 'Dose was succesfully destroyed.'
  end

  private

  def dose_params
    params.require(:dose).permit(:description, :cocktail_id, :ingredient_id)
  end

  def find_cocktail
    @cocktail = Cocktail.find(params[:cocktail_id])
  end
end
