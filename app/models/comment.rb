class Comment < ApplicationRecord
  include Associate

  associate :belongs_to, [:user, :slice], dependent: :destroy
end
