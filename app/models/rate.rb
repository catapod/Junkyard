class Rate < ApplicationRecord
  include Associate

  associate :belongs_to, [:user, :translation], dependent: :destroy
end
