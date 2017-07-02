# frozen_string_literal: true
require 'rails_helper'

RSpec.describe Translation, type: :model do
  # Validations
  it { should validate_presence_of(:chunk) }
  it { should validate_presence_of(:translator) }
  it { should validate_presence_of(:body) }

  # Associations
  it { should belong_to(:chunk) }
  it { should belong_to(:translator) }
  it { should have_many(:rates) }
end
