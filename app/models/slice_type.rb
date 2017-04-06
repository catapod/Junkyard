class SliceType < ApplicationRecord
  belongs_to :slice, dependent: :destroy
end
