# == Schema Information
#
# Table name: service_types
#
#  id         :integer          not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class ServiceType < ApplicationRecord
  translates :name, :slug

  globalize_accessors locales: [:it, :en], attributes: [:name, :slug]
  globalize_validations locales: [:it, :en]

  extend FriendlyId
  friendly_id :name, use: :globalize

  validates :name, presence: true, uniqueness: true
  validates :slug, presence: true, uniqueness: { case_sensitive: false }
  validate :validates_globalized_attributes

  has_many :services, dependent: :destroy
end
