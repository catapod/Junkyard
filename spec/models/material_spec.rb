# frozen_string_literal: true
require 'rails_helper'

RSpec.describe Material, type: :model do
  # Validations
  it { should validate_presence_of(:owner) }
  it { should validate_presence_of(:rightholder) }
  it { should validate_presence_of(:state) }
  it { should validate_presence_of(:license) }
  it { should validate_presence_of(:caption_original) }
  it { should validate_presence_of(:annotation_original) }
  it { should validate_presence_of(:original_language) }
  it { should validate_presence_of(:translation_language) }

  # Associations
  it { should belong_to(:owner) }
  it { should belong_to(:rightholder) }
  it { should belong_to(:state) }
  it { should belong_to(:license) }
end
