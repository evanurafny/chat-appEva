class ChatroomChannel < ApplicationCable::Channel
  def subscribed
    chatroom = Chatroom.find(params[:chatroom_id])
    stream_for chatroom
  end

  def speak(data)
    message = Message.create!(
      content: data['content'],             
      chatroom_id: data['chatroom_id']
    )
  ChatroomChannel.broadcast_to(message.chatroom, message)
  end
end
