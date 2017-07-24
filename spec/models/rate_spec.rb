# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Rate, type: :model do
  # Validations
  it { should validate_presence_of(:rater) }
  it { should validate_presence_of(:value) }
  it { should validate_presence_of(:translation) }

  # Associations
  it { should belong_to(:translation) }
  it { should belong_to(:rater) }
end
