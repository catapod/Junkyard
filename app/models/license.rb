class License < ApplicationRecord
  has_many :materials

  validates :name, presence: true
  validates :content, presence: true
end
