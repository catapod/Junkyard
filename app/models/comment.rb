class Comment < ApplicationRecord
  belongs_to :user, dependent: :destroy
  belongs_to :slice, dependent: :destroy
end
