class User < ApplicationRecord
  has_many :materials
  has_many :comments
  has_many :rates
  has_many :translations
end
