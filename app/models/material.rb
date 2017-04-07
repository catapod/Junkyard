class Material < ApplicationRecord
  belongs_to :license, dependent: :destroy
  belongs_to :user, dependent: :destroy
  belongs_to :rightholder, dependent: :destroy
  belongs_to :state, dependent: :destroy
  has_many :slices, dependent: :destroy
end
