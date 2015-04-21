#enconding: utf-8

class Wine < ActiveRecord::Base
  # Attributes
  attr_accessible :name, :type, :rating

  # Associations

  # Validations
  validates :type, format: { with: /\Ared\Z|\Awhite\Z/ }

  # Class methods
  
  # Methods
end