class Admin < ActiveRecord::Base
  # Validations
  validates :name, length: { minimum: 1 }

  # Overriding original renderin of model to json
  def serializable_hash(options={})
    super(options.merge({ except: [:updated_at, :created_at] }))
  end
end
