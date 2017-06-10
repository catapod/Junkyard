class CommentSerializer < ActiveModel::Serializer
  attributes :id, :body

  belongs_to :commentator
  belongs_to :chunk
end
