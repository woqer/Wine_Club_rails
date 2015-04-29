class Bottle < ActiveRecord::Base
  # Attributes
  # attr_accessible :wine_id, :package_id

  # Associations
  belongs_to :wine
  belongs_to :package
  
  has_many :shipments, through: :packages
  has_many :subscribers, through: :shipments


  # Scopes
  # scope :for_wine, ->(wine) { where(wine: wine) }
  # scope :for_package, ->(package) { where(package: package) }
  
  # Overriding original renderin of model to json
  def serializable_hash(options={})
    super(options.merge({ except: [:updated_at, :created_at] }))
  end
end
