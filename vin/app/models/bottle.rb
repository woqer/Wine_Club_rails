class Bottle < ActiveRecord::Base
  # Attributes
  # attr_accessible :wine_id, :package_id

  # Associations
  belongs_to :package
  belongs_to :wine

  
  # Overriding original renderin of model to json
  def serializable_hash(options={})
    super(options.merge({ except: [:updated_at, :created_at] }))
  end
end
