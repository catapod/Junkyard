class Translation < ApplicationRecord
  include Associate

  associate, :belongs_to, [:slice, :user], dependent: :destroy
end
