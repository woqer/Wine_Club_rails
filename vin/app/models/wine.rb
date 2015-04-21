#enconding: utf-8

class Wine < ActiveRecord::Base
  # Attributes
  # attr_accessible :name, :type, :rating

  # Associations

  # Validations
  validates_uniqueness_of :name
  validates :color, inclusion: { in: %w(R W) }

  # Class methods
  
  # Methods

  # Overriding original renderin of model to json
  def serializable_hash(options={})
    super(options.merge({ except: [:updated_at, :created_at] }))
  end
end
