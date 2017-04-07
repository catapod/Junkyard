class Rate < ApplicationRecord
  belongs_to :user, dependent: :destroy
  belongs_to :translation, dependent: :destroy
end
