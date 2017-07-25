# frozen_string_literal: true
require 'rails_helper'

RSpec.describe License, type: :model do
  # Validations
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:content) }

  # Associations
  it { should have_many(:materials) }
end
