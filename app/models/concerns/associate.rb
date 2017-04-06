module Associate
  extend ActiveSupport::Concern

  module ClassMethods
    def associate(ass_type, names = [], params = {})
      names.each do |n|
        send ass_type, n, params
      end
    end
  end
end