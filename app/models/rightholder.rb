class Rightholder < ApplicationRecord
  has_many :materials

  validates :caption_original, presence: true
  validates :short_original, presence: true
end
