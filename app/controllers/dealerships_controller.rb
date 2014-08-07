class DealershipsController < ApplicationController
  def index
    @dealerships = Dealership.all
  end

  def show
    @dealership = Dealership.find params[:id]
  end

  def new
    @dealership = Dealership.new
  end

  def create
    @dealership = Dealership.create dealership_params
    redirect_to dealerships_path
  end

  def edit
    @dealership = Dealership.find params[:id]
  end

  def update
    @dealership = Dealership.find params[:id]
    @dealership.update_attributes dealership_params
    redirect_to dealerships_path
  end

  def destroy
    @dealership = Dealership.find params[:id]
    @dealership.delete
    redirect_to dealerships_path
  end
private
  def dealership_params
    params.require(:dealership).permit(:name, :description)
  end
end
