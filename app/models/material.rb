# frozen_string_literal: true

# Material model
class Material < ApplicationRecord
  belongs_to :owner, class_name: 'User'
  belongs_to :rightholder
  belongs_to :license
  belongs_to :state

  has_many :chunks

  has_and_belongs_to_many :tags, class_name: 'MaterialTag'

  validates :owner, presence: true
  validates :rightholder, presence: true
  validates :license, presence: true
  validates :state, presence: true
  validates :caption_original, presence: true
  validates :annotation_original, presence: true
  validates :original_language, presence: true
  validates :translation_language, presence: true
end
