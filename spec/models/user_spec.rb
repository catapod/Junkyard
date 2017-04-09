require 'rails_helper'

RSpec.describe User, type: :model do
  # Validations
  it { should validate_presence_of(:nickname) }

  # Associations
  it { should have_many(:materials) }
  it { should have_many(:translations) }
  it { should have_many(:rates) }
  it { should have_many(:comments) }
end
