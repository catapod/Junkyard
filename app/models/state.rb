class State < ApplicationRecord
  has_many :materials, dependent: :destroy
end
