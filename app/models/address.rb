class Address < ActiveRecord::Base
  # Attributes
  # attr_accessible :street, :city, :state, :zip

  # Associations
  belongs_to :subscribers
  # Validations
  validates_presence_of :street, :city, :state, :zip
  validate :street, length: { minimum: 1 }
  validate :city, length: { minimum: 1 }
  validate :state, length: { minimum: 2 }, exclusion: { in: %w(Alabama Arkansas Delaware Kentuky Massachusetts Mississippi Oklahoma Pensilvania South Dakota Utah) }
  validate :zip, length: 5

  # Overriding original renderin of model to json
  def serializable_hash(options={})
    super(options.merge({ except: [:updated_at, :created_at] }))
  end
end
