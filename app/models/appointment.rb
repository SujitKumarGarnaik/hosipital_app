class Appointment < ApplicationRecord
  belongs_to :doctor
  belongs_to :patient

  after_initialize :set_default_status, if: :new_record?

  validates :doctor_id, presence: true
  validates :patient_id, presence: true
  validates :appointment_date, presence: true
  validates :appointment_time, presence: true

  validate :doctor_exact_time_availability, :doctor_daily_limit
  validates :status, inclusion: { in: ['scheduled', 'completed', 'cancelled'] }, allow_nil: true

  private

  def set_default_status
    self.status ||= 'scheduled'
  end

    def doctor_exact_time_availability
      return if status_changed?
    if Appointment.exists?(doctor_id: doctor_id, appointment_date: appointment_date, appointment_time: appointment_time)
      errors.add(:base, "Doctor is already booked at this exact time. Please choose a different time.")
    end
  end


  def doctor_daily_limit
    daily_appointments = Appointment.where(doctor_id: doctor_id, appointment_date: appointment_date).count
    if daily_appointments >= 10
      errors.add(:base, "Doctor has reached the daily limit of 10 appointments. Please choose another day.")
    end
  end
end
