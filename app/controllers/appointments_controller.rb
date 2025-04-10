class AppointmentsController < ApplicationController
  before_action :set_patient, only: [:new, :create, :index, :edit, :update, :destroy]
  before_action :set_appointment, only: [:edit, :update, :destroy, :cancel, :complete]
  before_action :set_doctors, only: [:new, :edit, :create]

  def index
    @appointments = Appointment.includes(:patient, :doctor).all
  end

  def show
    @appointment = Appointment.includes(:patient, :doctor).find(params[:id])
    @patient = @appointment.patient
    @doctor = @appointment.doctor
  end

  def new
    @appointment = @patient ? @patient.appointments.build : Appointment.new
    @patients = Patient.all if @patient.nil?  
  end

  def create
    @appointment = Appointment.new(appointment_params)
  
    if @appointment.save
      redirect_to appointments_path, notice: "Appointment successfully created."
    else
      @doctors = Doctor.all
      @patients = Patient.all
      flash.now[:alert] = "Failed to book appointment. Please check errors below."
      render :new
    end
  end

  def edit
    @doctors = Doctor.all
  end

  def update
    if @appointment.update(appointment_params)
      redirect_to appointments_path, notice: 'Appointment updated successfully.'
    else
      flash.now[:alert] = @appointment.errors.full_messages.join(", ")
      render :edit
    end
  end
  
  def destroy
    @appointment.destroy
    redirect_to appointments_path, notice: 'Appointment canceled.'
  end

  def cancel
    if @appointment.can_cancel? && @appointment.update(status: 'cancelled')
      redirect_to appointments_path, notice: 'Appointment cancelled.'
    else
      redirect_to appointments_path, alert: 'Cannot cancel past appointments.'
    end
  end

  def complete
    if @appointment.can_complete? && @appointment.update(status: 'completed')
      redirect_to appointments_path, notice: 'Appointment marked as completed.'
    else
      redirect_to appointments_path, alert: 'Failed to update status.'
    end
  end

  def update_status
    @appointment = Appointment.find(params[:id])
  
    if @appointment.update(status: params[:appointment][:status])
      flash[:notice] = "Appointment status updated successfully."
    else
      flash[:alert] = "Failed to update appointment status."
    end
  
    redirect_to appointments_path 
  end
  
  private

  def set_patient
    @patient = params[:patient_id].present? ? Patient.find(params[:patient_id]) : nil
  end

  def set_appointment
    @appointment = Appointment.find(params[:id])
  end

  def set_doctors
    @doctors = Doctor.all
  end

  def appointment_params
    params.require(:appointment).permit(:doctor_id, :patient_id, :appointment_date, :appointment_time, :status)
  end
  
end
