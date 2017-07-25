# frozen_string_literal: true
# Default comment json serializer
class CommentSerializer < ActiveModel::Serializer
  attributes :id, :body, :created_at, :updated_at

  belongs_to :commentator
end
