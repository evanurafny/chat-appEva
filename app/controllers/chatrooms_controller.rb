class ChatroomsController < ApplicationController
  def index
    @chatrooms = Chatroom.all
    render json: @chatrooms
  end

  def show
    @chatroom = Chatroom.find(params[:id])
    render json: @chatroom
  end

  def create
    @chatroom = Chatroom.new(chatroom_params)
    if @chatroom.save
      render json: @chatroom, status: :created
    else
      render json: { errors: chatroom.errors.full_messages }, status: :unprocessable_entity
    end
  end
 def destroy
    chatroom = Chatroom.find(params[:id])
    chatroom.destroy
  ActionCable.server.broadcast("chatroom_list", { action: "deleted", id: chatroom.id })
    head :no_content # atau render json: {}, status: :ok
  end

  private

  def chatroom_params
    params.require(:chatroom).permit(:name)
  end
end
