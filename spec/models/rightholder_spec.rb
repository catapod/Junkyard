# frozen_string_literal: true
require 'rails_helper'

RSpec.describe Rightholder, type: :model do
  # Validations
  it { should validate_presence_of(:caption_original) }
  it { should validate_presence_of(:short_original) }

  # Associations
  it { should have_many(:materials) }
end
