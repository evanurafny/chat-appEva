require 'rails_helper'

RSpec.describe Message, type: :model do
  it "valid jika ada content dan chatroom" do
    chatroom = Chatroom.create!(name: "Test Room")
    message = Message.new(content: "Halo dunia", chatroom: chatroom)

    expect(message).to be_valid
  end

  it "invalid jika content kosong" do
    message = Message.new(content: nil)

    expect(message).not_to be_valid
  end
end
