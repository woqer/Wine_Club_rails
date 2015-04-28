#enconding: utf-8

class Subscriber < ActiveRecord::Base

  # Attributes
  # attr_accessible :name, :email, :phone, :address_id, :fb, :tw

  # Associations
  has_many :shipments
  has_many :packages, through: :shipments
  has_one :address

  # Validations
  validates_presence_of :name, :email, :phone, :address
  validates_uniqueness_of :email
  validates :name, length: { minimum: 1 }
  validates :phone, length: { minimum: 4 }
  validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i }, uniqueness: { case_sensitive: false }

  # Scopes
  scope :by_email, ->(email) { where('email like ?', "%#{email}%") }

  # ClassMethods
  def self.search(query)
    if query.blank?
      self.all
    else
      # by_email query
      where("name like ? email like ? phone like ?", query)
    end
  end

  # Methods
  def email_formatter(email)
    email_ary = email.split("@")
    email_ary[0].delete!(".+")
    email_ary.join("@")
  end

  # def search(query)
  #   # sub = { wines: self.packages.uniq_wines, notes: self.packages.pluck(:note), shipments: self.shipments }
  #   if query.blank?
  #     self
  #   else
  #     q = "%#{query}%"
  #     where("wine.name like ? OR wine.color like ? OR package.note like ?", q, q, q)
  #   end
  # end

  # Overriding original renderin of model to json
  def serializable_hash(options={})
    super(options.merge({ except: [:id, :updated_at, :created_at], include: { address: {except: [:id, :updated_at, :created_at] }}}))
  end

end
