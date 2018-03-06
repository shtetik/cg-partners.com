# == Schema Information
#
# Table name: articles
#
#  id              :integer          not null, primary key
#  article_type_id :integer          not null
#  person_id       :integer          not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class Article < ApplicationRecord
  translates :title, :description, :text, :slug

  extend FriendlyId

  friendly_id :title, use: :globalize

  globalize_accessors locales: [:it, :en],
                      attributes: [:title, :description, :text, :slug]
  globalize_validations locales: :it

  validates :title, :description, :text, :article_type, :person, presence: true
  validates :slug, presence: true, uniqueness: { case_sensitive: false }
  validate :validates_globalized_attributes

  belongs_to :article_type
  belongs_to :person
end
