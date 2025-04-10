namespace :appointments do
  task cancel_past_appointments: :environment do
    # Cancels all appointments that are in the past
    Appointment.where("appointment_date < ?", Time.current).update_all(status: 'cancelled')
    puts "Cancelled past appointments."
  end
end
