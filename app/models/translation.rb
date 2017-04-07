class Translation < ApplicationRecord
  belongs_to :slice, dependent: :destroy
  belongs_to :user, dependent: :destroy
end
