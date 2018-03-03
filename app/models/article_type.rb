class ArticleType < ApplicationRecord
  translates :name, :slug

  extend FriendlyId

  friendly_id :name, use: :globalize

  globalize_accessors

  validates :name, presence: true, uniqueness: true
  validates :slug, presence: true, uniqueness: { case_sensitive: false }

  has_many :articles, dependent: :destroy
end
