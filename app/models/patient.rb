class Patient < ApplicationRecord
  has_many :appointments, dependent: :destroy
  has_many :doctors, through: :appointments, source: :doctor
  belongs_to :doctor, optional: true  

  validates :name, presence: true
  validates :age, presence: true, numericality: { greater_than_or_equal_to: 0, only_integer: true }
  validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP, message: "must be a valid email address" }
  validates :phone, presence: true

  def delete_patient
    update(deleted_at: Time.current)  
  end

  scope :active, -> { where(deleted_at: nil) }

  def deleted?
    deleted_at.present?
  end
end
