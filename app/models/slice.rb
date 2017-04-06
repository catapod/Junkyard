class Slice < ApplicationRecord
  belongs_to :material, dependent: :destroy
  has_one :slice_type, dependent: :destroy
end
