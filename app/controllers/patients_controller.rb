class PatientsController < ApplicationController
  before_action :set_patient, only: [:show, :edit, :update, :destroy]

  def index
    @patients = Patient.includes(:appointments, :doctors).all
  end

  def new
    @patient = Patient.new
  end

  def show
    @appointments = @patient.appointments.includes(:doctor)
  end

  def edit
    
  end

  def update
    if @patient.update(patient_params)
      redirect_to patients_path, notice: 'Patient details updated successfully.'
    else
      render :edit
    end
  end

  def destroy
    @patient.destroy
    redirect_to patients_url, notice: 'Patient was successfully destroyed.'
  end

  def create
    @patient = Patient.new(patient_params)

    if @patient.save
      redirect_to patients_path, notice: 'Patient was successfully created.'
    else
      render :new
    end
  end

  private

  def set_patient
    @patient = Patient.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    redirect_to patients_path, alert: 'Patient not found.'
  end

  def patient_params
    params.require(:patient).permit(:name, :age, :phone, :email, :address)
  end
end
