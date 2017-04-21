class User < ApplicationRecord
  has_many :materials, foreign_key: 'owner_id'
  has_many :comments, foreign_key: 'commentator_id'
  has_many :rates, foreign_key: 'rater_id'
  has_many :translations, foreign_key: 'translator_id'

  validates :nickname, presence: true
end
