class Translation < ApplicationRecord
  belongs_to :chunk
  belongs_to :translator, class_name: 'User'
  has_many :rates

  validates :chunk, presence: true
  validates :translator, presence: true
  validates :body, presence: true
end
