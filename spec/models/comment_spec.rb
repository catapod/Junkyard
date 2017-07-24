# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Comment, type: :model do
  # Validations
  it { should validate_presence_of(:chunk) }
  it { should validate_presence_of(:commentator) }
  it { should validate_presence_of(:body) }

  # Associations
  it { should belong_to(:chunk) }
  it { should belong_to(:commentator) }
end
