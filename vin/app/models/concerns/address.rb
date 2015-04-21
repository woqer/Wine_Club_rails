#enconding: utf-8

class Address < ActiveRecord::Base

  # Attributes
  attr_accessible :street, :city, :state, :zip

  # Validations
  validate_presence_of :street, :city, :state, :zip
  validate :street, length: { minimum: 1 }
  validate :city, length: { minimum: 1 }
  validate :state, length: { minimum: 2 }
  validate :zip, length: 5

end