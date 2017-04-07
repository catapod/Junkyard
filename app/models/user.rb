class User < ApplicationRecord
  has_many :materials, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :rates, dependent: :destroy
  has_many :translations, dependent: :destroy
end
