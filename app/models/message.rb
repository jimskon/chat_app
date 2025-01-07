class Message < ApplicationRecord
  belongs_to :user
  after_create_commit ( broadcast_prepend_to "chat_room_#{chat_room_id}" )
end
