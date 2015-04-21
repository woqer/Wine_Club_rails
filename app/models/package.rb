#enconding: utf-8

class Package < ActiveRecord::Base
  # Attributes
  # attr_accessible :type, :note

  # Associations
  has_many :bottles
  has_many :wine, through: :bottles
  belongs_to :shipments

  # Validations
  validates :mix, inclusion: { in: %w(AR AW RW) }


  # Class methods
  def self.uniq_wines
    @relation.map { |p| p.uniq_wines }
  end

  # Methods
  def uniq_wines
    self.wine.uniq
  end

  # Overriding original renderin of model to json
  def serializable_hash(options={})
    super(options.merge({ except: [:updated_at, :created_at, :shipment_id] }))
  end
end
