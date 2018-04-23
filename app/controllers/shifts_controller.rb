class ShiftsController < ApplicationController
  before_action :set_restaurant_shift, only: [:show, :update, :destroy]

  # GET /@shifts
  def index
    @shifts = Shift.all

    render json: @shifts
  end

  # GET /@shifts/1
  def show
    render json: @shift
  end

  # POST /@shifts
  def create
    @shift = Shift.new(restaurant_shift_params)

    if @shift.save
      render json: @shift, status: :created, location: @shift
    else
      render json: @shift.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /@shifts/1
  def update
    if @shift.update(restaurant_shift_params)
      render json: @shift
    else
      render json: @shift.errors, status: :unprocessable_entity
    end
  end

  # DELETE /@shifts/1
  def destroy
    @shift.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_restaurant_shift
      @shift = Shift.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def restaurant_shift_params
      params.require(:shift).permit(:name, :start_time, :end_time, :restaturant_id)
    end
end
