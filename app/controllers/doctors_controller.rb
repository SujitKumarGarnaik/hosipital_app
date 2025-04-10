class DoctorsController < ApplicationController
  before_action :set_doctor, only: [:show, :edit, :update, :destroy]

  def index
    @doctors = Doctor.all
  end

  def show
    
  end

  def new
    @doctor = Doctor.new
  end

  def create
    @doctor = Doctor.new(doctor_params)
    if @doctor.save
      redirect_to doctors_path, notice: 'Doctor has been successfully added.'
    else
      render :new
    end
  end

  def edit
    
  end

  def update
    if @doctor.update(doctor_params)
      redirect_to doctors_path, notice: 'Doctor details updated successfully.'
    else
      render :edit
    end
  end

  def destroy
    @doctor.destroy
    redirect_to doctors_path, notice: 'Doctor has been removed successfully.'
  end

  private

  def set_doctor
    @doctor = Doctor.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    redirect_to doctors_path, alert: 'Doctor not found.'
  end

  def doctor_params
    params.require(:doctor).permit(:name, :specialization, :address, :joining_date)
  end
end
