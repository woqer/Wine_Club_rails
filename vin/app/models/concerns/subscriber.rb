#enconding: utf-8

class Subscriber < ActiveRecord::Base

  # Attributes
  attr_accessible :name, :email, :phone, :address_id, :fb, :tw

  # Associations
  has_many :shipments
  belongs_to :address

  # Validations
  validate_presence_of :name, :email, :phone, :address
  validates :person, length: { minimum: 1 }
  validates :phone, length: { minimum: 4 }
  validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i }, uniqueness: { case_sensitive: false }

  # Scopes
  scope :by_email, lambda { |email| where('email like ?', "%#{email}") }

  # ClassMethods
  def self.search(email)
    if email.blank?
      find(:all)
    else
      by_email
    end
  end

  # Methods
  def email_formater(email)
    email_ary = email.split("@")
    email_ary[1].delete!(".+")
    email_ary.join("@")
  end

end
