#enconding: utf-8

class Shipment < ActiveRecord::Base
  # Attributes
  # attr_accessible :date, :status

  # Associations
  belongs_to :subscriber
  has_one :package

  # Validations
  # validates :status, format: { with: /\Adelivered\Z|\Acancelled\Z|\Ascheduled\Z/ }
  validates :status, inclusion: { in: %w(delivered cancelled scheduled) }

  # Class methods
  def self.selection_month
    @relation.map { |s| s.selection_month }
  end

  # Methods
  def selection_month
    selection_month = self.date.strftime("%b/%Y")
    {
      id: self.id,
      selection_month: selection_month,
      status: self.status
    }
  end

  def show
    wines = self.package.wine.uniq.flat_map do |w|
      { id: w.id, name: w.name }
    end
    sm = self.selection_month
    sm.delete(:id)
    sm.merge({
      date: self.date.strftime("%d-%b-%Y"),
      type: self.package.mix,
      wines: wines
      })
  end

  # Overriding original renderin of model to json
  def serializable_hash(options={})
    super(options.merge({ except: [:updated_at, :created_at, :date, :subscriber_id] }))
  end
end
