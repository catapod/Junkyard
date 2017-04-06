class User < ApplicationRecord
  include Associate

  associate :has_many, [:materials, :comments, :rates, :translations], dependent: :destroy
end
