namespace :appointments do
    task cancel_past_appointments: :environment do
      Appointment.where("appointment_date < ?", Time.current).update_all(status: 'cancelled')
      puts "Cancelled past appointments."
    end
  end
  