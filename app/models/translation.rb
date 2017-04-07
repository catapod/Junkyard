class Translation < ApplicationRecord
  belongs_to :slice
  belongs_to :user
end
