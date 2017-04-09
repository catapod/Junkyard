class Translation < ApplicationRecord
  belongs_to :chunk
  belongs_to :user
end
