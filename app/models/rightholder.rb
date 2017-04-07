class Rightholder < ApplicationRecord
  has_many :materials, dependent: :destroy
end
