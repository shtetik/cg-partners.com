class Service < ApplicationRecord
  translates :title, :text, :slug

  extend FriendlyId

  friendly_id :title, use: :globalize

  globalize_accessors

  validates :title, presence: true, uniqueness: true
  validates :text, :service_type, presence: true
  validates :slug, presence: true, uniqueness: { case_sensitive: false }

  belongs_to :service_type
end
