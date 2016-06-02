class Contact < ActiveRecord::Base
  validates :name, :email, :state, presence: true
end
