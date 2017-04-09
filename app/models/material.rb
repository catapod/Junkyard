class Material < ApplicationRecord
  belongs_to :owner, class_name: 'User'
  belongs_to :rightholder
  belongs_to :license
  belongs_to :state

  has_many :slices

  validates :owner, presence: true
  validates :rightholder, presence: true
  validates :license, presence: true
  validates :state, presence: true
  validates :caption_original, presence: true
  validates :annotation_original, presence: true
  validates :original_language, presence: true
  validates :translation_language, presence: true
end
