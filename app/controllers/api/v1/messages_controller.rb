class Api::V1::MessagesController < ApplicationController
  before_action :set_channel

  def index
    messages = @channel.messages
    api_messages = messages.map do |message|
      {
        id: message.id,
        author: User.find(message.user_id).email,
        content: message.content,
        created_at: message.created_at
      }
    end
    render json: api_messages
  end

  def create
  end

  private

  def set_channel
    @channel = Channel.find_by(name: params[:channel_id])
  end
end
