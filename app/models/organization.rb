class Organization < ApplicationRecord
  has_many :memberships, dependent: :destroy
  has_many :users, through: :memberships
  has_many :projects
  validates :name, :presence => true
end
