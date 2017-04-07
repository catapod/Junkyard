class Material < ApplicationRecord
  belongs_to :license
  belongs_to :user
  belongs_to :rightholder
  belongs_to :state
  has_many :slices
end
