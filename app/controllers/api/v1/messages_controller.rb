class Api::V1::MessagesController < ApplicationController
  before_action :set_channel

  def index
    messages = @channel.messages
    api_messages = messages.map{|message| prepare_for_api(message) }
    render json: api_messages
  end

  def create
    @message = Message.new(message_params)
    @message.channel = @channel
    @message.user = current_user
    @message.save

    render json: prepare_for_api(@message)
  end

  private

  def set_channel
    @channel = Channel.find_by(name: params[:channel_id])
  end

  def message_params
    params.require(:message).permit(:content)
  end

  def prepare_for_api(message)
    {
      id: message.id,
      author: User.find(message.user_id).email,
      content: message.content,
      created_at: message.created_at
    }
  end
end
