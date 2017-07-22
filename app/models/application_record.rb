# frozen_string_literal: true
# Default model abstract class
class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true
end
