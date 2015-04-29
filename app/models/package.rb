#enconding: utf-8

class Package < ActiveRecord::Base
  # Attributes
  # attr_accessible :type, :note

  # Associations
  belongs_to :shipment
  has_many :subscribers, through: :shipments

  has_many :bottles
  has_many :wines, through: :bottles

  # Validations
  validates :mix, inclusion: { in: %w(AR AW RW) }

  # Scopes
  # scope :uniq_wines, -> { select(:wines) }
  scope :for_shipment, ->(shipment) { where(shipment: shipment) }
  scope :for_wine, ->(wine) {where(wine: wine)}

  # Class methods
  # def self.uniq_wines
  #   @relation.flat_map { |p| p.uniq_wines }.uniq
  # end

  def self.search(query)
    if query.blank?
      self.all
    else
      q = "%#{query}%"
      where("mix like ? OR note like ?", q, q)
    end
  end

  # Methods
  # def uniq_wines
  #   self.wines.uniq
  # end

  # Overriding original renderin of model to json
  def serializable_hash(options={})
    super(options.merge({ except: [:updated_at, :created_at, :shipment_id] }))
  end
end
