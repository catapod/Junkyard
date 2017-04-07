class Material < ApplicationRecord
  has_one :license, dependent: :destroy
  has_one :user, dependent: :destroy
  has_one :rightholder, dependent: :destroy
  has_one :state, dependent: :destroy
  has_many :slices, dependent: :destroy
end
