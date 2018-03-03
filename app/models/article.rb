class Article < ApplicationRecord
  translates :title, :description, :text, :slug

  extend FriendlyId

  friendly_id :title, use: :globalize

  globalize_accessors

  validates :title, :description, :text, :article_type, :person, presence: true
  validates :slug, presence: true, uniqueness: { case_sensitive: false }

  belongs_to :article_type
  belongs_to :person
end
