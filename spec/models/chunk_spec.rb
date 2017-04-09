require 'rails_helper'

RSpec.describe Chunk, type: :model do
  # Validations
  it { should validate_presence_of(:material) }
  it { should validate_presence_of(:chunk_type) }
  it { should validate_presence_of(:material_position) }
  it { should validate_presence_of(:translatable) }
  it { should validate_presence_of(:body) }

  # Associations
  it { should belong_to(:material) }
  it { should belong_to(:chunk_type) }
  it { should have_many(:translations) }
  it { should have_many(:comments) }
end
