#enconding: utf-8

class Package < ActiveRecord::Base
  # Attributes
  attr_accessible :wine1_id, :wine2_id, :wine3_id, :wine4_id,
                  :wine5_id, :wine6_id, :type, :note

  # Associations
  belongs_to :wine

  # Validations
  validates :type, format: { with: /\AAR\Z|\AAW\Z|\ARW\Z/ }

  # Class methods

  # Methods

end