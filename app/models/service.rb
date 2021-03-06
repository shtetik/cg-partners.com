# == Schema Information
#
# Table name: services
#
#  id              :integer          not null, primary key
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  service_type_id :integer          not null
#

class Service < ApplicationRecord
  translates :title, :text, :slug

  extend FriendlyId

  friendly_id :title, use: :globalize

  globalize_accessors locales: [:it, :en], attributes: [:title, :text, :slug]
  globalize_validations locales: [:it, :en]

  validates :title, presence: true, uniqueness: true
  validates :text, :service_type, presence: true
  validates :slug, presence: true, uniqueness: { case_sensitive: false }
  validate :validates_globalized_attributes

  belongs_to :service_type
end
