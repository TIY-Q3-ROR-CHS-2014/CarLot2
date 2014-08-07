class CarsController < ApplicationController
  before_action :set_car, only: [:show, :edit, :update, :destroy, :sell_car, :reserve, :reneg]

  # before_action :set_dealership

  # GET /cars
  # GET /cars.json
  def index
    @cars = Car.all
    @dealership = Dealership.find params[:dealership_id]
  end

  # GET /cars/1
  # GET /cars/1.json
  def show
    p '*'*100
    p params
    @dealership = Dealership.find params[:dealership_id]
  end

  # GET /cars/new
  def new
    @car = Car.new
    @dealership = Dealership.find params[:dealership_id]
  end

  # GET /cars/1/edit
  def edit
    @dealership = Dealership.find params[:dealership_id]
  end

  # POST /cars
  # POST /cars.json
  def create
    
    @dealership = Dealership.find params[:dealership_id]
    # This will create a new car object OFF OF THE DEALERSHIP. So it will create the relationship between the two.
    # Car.new({make: "Honda", dealership_id: @dealership.id})
    @car = @dealership.cars.new(car_params)
    # p @dealership.cars
    respond_to do |format|
      if @car.save
        flash[:notice] = "Car was successfully created"
        format.html { redirect_to dealership_path(@dealership) }
      else
        flash[:error] = "Car was not successfully created"
        format.html { render :new }
      end
    end
  end

  # PATCH/PUT /cars/1
  # PATCH/PUT /cars/1.json
  def update
    @dealership = Dealership.find params[:dealership_id]
    respond_to do |format|
      if @car.update(car_params)
        format.html { redirect_to dealership_path(@dealership), notice: 'Car was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  # DELETE /cars/1
  # DELETE /cars/1.json
  def destroy
    @dealership = Dealership.find params[:dealership_id]
    @car.destroy
    respond_to do |format|
      format.html { redirect_to dealership_path(@dealership), notice: 'Car was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def sell_car
    @dealership = Dealership.find params[:dealership_id]
    # @car = Car.find params[:id]
    @car.sell!
    redirect_to cars_url
  end

  def reserve
    @dealership = Dealership.find params[:dealership_id]
    @car.reserve!
    redirect_to cars_url
  end

  def reneg
    @dealership = Dealership.find params[:dealership_id]
    @car.reneg!
    redirect_to cars_url
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_car
      @car = Car.find(params[:id])
    end

    # def set_dealership
    #   @dealership = Dealership.find params[:dealership_id]
    # end

    # Never trust parameters from the scary internet, only allow the white list through.
    def car_params
      params.require(:car).permit(:make, :model, :year)
    end
end
