class ChannelChannel < ApplicationCable::Channel
  def subscribed
    stream_for "channels"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
