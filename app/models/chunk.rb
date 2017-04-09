class Chunk < ApplicationRecord
  belongs_to :material
  belongs_to :chunk_type
end
