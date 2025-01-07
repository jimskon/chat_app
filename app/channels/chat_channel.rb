class ChatChannel < ApplicationCable::Channel
  def subscribed
    # Use `data` to fetch subscription parameters
    room = params_from_identifier["room"]
    stream_from "chat_#{room}"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  private

  def params_from_identifier
    identifier = self.params[:identifier]
    identifier.present? ? JSON.parse(identifier) : {}
  end
end
