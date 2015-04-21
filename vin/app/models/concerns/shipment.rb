#enconding: utf-8

class Shipment < ActiveRecord::Base
  # Attributes
  attr_accessible :date, :status, :package_id

  # Associations
  belongs_to :package

  # Validations
  validates :status, format: { with: /\Adelivered\Z|\Acancelled\Z|\Ascheduled\Z/ }

  # Class methods
  
  # Methods
end