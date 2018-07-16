class User < ApplicationRecord
  has_secure_password
  #has_many :sites
  #has_many :windows, through: :sites
  has_many :comments
  has_many :sites, through: :comments

  validates :name, presence: true
  validates :email, presence: true, uniqueness: true

  #scope :active, -> { order("site_windows_count DESC")}
end
