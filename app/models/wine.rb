#enconding: utf-8

class Wine < ActiveRecord::Base
  # Attributes
  # attr_accessible :name, :type, :rating

  # Associations
  has_many :bottles
  has_many :packages, through: :bottles

  # Validations
  validates_uniqueness_of :name
  validates :color, inclusion: { in: %w(R W) }

  # Scopes
  scope :for_packages, ->(package) { where(package: package) }

  # Class methods
  def self.search(query)
    if query.blank?
      self.all
    else
      q = "%#{query}%"
      where("name like ? OR color like ?", q, q)
    end
  end
  # Methods

  # Overriding original renderin of model to json
  def serializable_hash(options={})
    super(options.merge({ except: [:updated_at, :created_at] }))
  end
end
