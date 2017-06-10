# frozen_string_literal: true
require 'factory_girl_rails'

chunks_count = 10
max_translations_count = 5
max_comments_count = 5
users_count = 2

authorized_user = create(:user)
material = create(:material, owner: authorized_user)

users = create_list(:user, users_count)
users.unshift(authorized_user)

create_list(:chunk, chunks_count, material: material).each do |chunk|
  rand(max_translations_count).times do
    translator = users.sample
    create(:translation, chunk: chunk, translator: translator)
  end

  rand(max_comments_count).times do
    commentator = users.sample
    create(:comment, chunk: chunk, commentator: commentator)
  end
end
