require 'test_helper'

class AuctionClearMessageTranslatorTest < Minitest::Test

  def setup
    @listener = mock("AuctionEventListener")
    @translator = AuctionMessageTranslator.new(@listener)
  end

  def test_notify_auction_closed_when_close_message_received
    message = Message.new
    message.body = "SOLVersion: 1.1; Event: CLOSE;"
    @listener.expects(:auction_closed).once
    @translator.process_message(UNUSED_CHAT, message)
  end
end

UNUSED_CHAT='foo'

class AuctionMessageTranslator
  def initialize(listener)
    @listener = listener
  end

  def process_message(arg0, message)
    @listener.auction_closed
  end
end

class Message
  attr_accessor :body
end
