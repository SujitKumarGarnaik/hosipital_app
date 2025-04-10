class Doctor < ApplicationRecord
  has_many :appointments, dependent: :destroy
  has_many :patients, through: :appointments

  validates :name, presence: true, uniqueness: true  
  validates :specialization, presence: true          
  validates :address, presence: true 

end
