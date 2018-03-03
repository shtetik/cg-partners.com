class ServiceType < ApplicationRecord
  translates :name, :slug

  globalize_accessors

  extend FriendlyId
  friendly_id :name, use: :globalize

  validates :name, presence: true, uniqueness: true
  validates :slug, presence: true, uniqueness: { case_sensitive: false }

  has_many :services, dependent: :destroy
end
