class State < ApplicationRecord
  belongs_to :material, dependent: :destroy
end
