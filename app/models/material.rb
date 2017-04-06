class Material < ApplicationRecord
  include Associate

  associate :has_one, [:license, :user, :rightholder, :state], dependent: :destroy
  has_many :slices, dependent: :destroy
end
