class Slice < ApplicationRecord
  belongs_to :material, dependent: :destroy
  belongs_to :slice_type, dependent: :destroy
end
