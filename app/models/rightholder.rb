class Rightholder < ApplicationRecord
  belongs_to :material, dependent: :destroy
end
