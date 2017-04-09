require 'rails_helper'

RSpec.describe MaterialTag, type: :model do
  # Validations
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:display_name) }
  it { should validate_presence_of(:body) }
end
