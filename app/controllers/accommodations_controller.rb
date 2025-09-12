class AccommodationsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_accommodation, only: %i[show edit update destroy]
  before_action :authorize_accommodation, only: %i[show edit update destroy]
  before_action :authorize_new_accommodation, only: %i[new create]

  def show; end

  def new
    @accommodation = Accommodation.new
  end

  def create
    @accommodation = Accommodation.new(accommodation_params)
    if @accommodation.save
      redirect_to @accommodation, notice: "Created"
    else
      render :new
    end
  end

  def edit; end

  def update
    if @accommodation.update(accommodation_params)
      redirect_to @accommodation, notice: "Updated"
    else
      render :edit
    end
  end

  def destroy
    @accommodation.destroy
    redirect_to students_path, notice: "Deleted"
  end

private

  def set_accommodation
    @accommodation = Accommodation.find(params[:id])
  end

  def authorize_accommodation
    authorize @accommodation
  end

  def authorize_new_accommodation
    authorize Accommodation
  end

  def accommodation_params
    params.require(:accommodation).permit(:name, :details, :accommodation_type)
  end
end
