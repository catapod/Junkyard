require 'rails_helper'

RSpec.describe ChunkType, type: :model do
  # Validations
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:display_name) }

  # Associations
  it { should have_many(:chunks) }
end
