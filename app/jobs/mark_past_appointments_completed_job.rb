class MarkPastAppointmentsCompletedJob < ApplicationJob
  queue_as :default

  def perform
    past_appointments = Appointment.scheduled.where("appointment_date < ?", Date.today)
    
    Rails.logger.info "Marking #{past_appointments.count} past appointments as completed..."
    
    past_appointments.update_all(status: 1)

    Rails.logger.info "Completed marking past appointments."
  end
end
