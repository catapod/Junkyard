require 'rails_helper'

RSpec.describe State, type: :model do
  # Validations
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:display_name) }

  # Associations
  it { should have_many(:materials) }
end
