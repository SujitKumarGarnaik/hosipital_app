class HomeController < ApplicationController
  def index
    @patients = Patient.all
    @doctors = Doctor.all
    @appointments = Appointment.where(status: :completed)  
    
    @patient = Patient.first 
  end
end
