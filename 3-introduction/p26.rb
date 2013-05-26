require 'test_helper'

class AuctionClearMessageTranslatorTest < Minitest::Test   # (2)

  def setup   # (3)
    @listener = mock("AuctionEventListener")  # (4)
    @translator = AuctionMessageTranslator.new(@listener)
  end

  def test_notify_auction_closed_when_close_message_received   # (5)
    message = Message.new
    message.body = "SOLVersion: 1.1; Event: CLOSE;"
    @listener.expects(:auction_closed).once                  # (7)
    @translator.process_message(UNUSED_CHAT, message)        # (6)
  end
end

=begin

1) In our case, we don't need a specialized runner. The mocking
   package we're using, FlexMock, mixes its methods into
   Test::Unit::TestCase. 'mock-talk.rb' requires FlexMock as well as
   other utilities.

2) Tests descend from Test::Unit::TestCase. I'm (mostly) using good
   old test-unit instead of new-fangled test frameworks like rspec.

3) In GOOS (the book), they define the mock and translator as
   constants. I could do the same, but then I'd have to create the
   mock in a less pleasing way.

4) Within the instance variables of a test class, flexmock() defines a
   mock. Unlike in Java, you don't have to tell FlexMock what class or 
   interface to mock. You define the interface by telling the mock what
   to expect.

5) I'm using the Shoulda gem so that I can give more readable names to
   tests. None of those TestNamesWithStudlyCapsForUs!

6) As in GOOS, this line says that the listener should receive the
   'auction_closed' method exactly once.

7) I find tests more readable when they first tell you the method
   that's being tested and then detail the expectations. In Java
   (without blocks), you have to define the expectations first so that
   they've been set up before the method runs. In Ruby, we have more
   control over execution order.

=end

UNUSED_CHAT='foo'

class AuctionMessageTranslator
  def initialize(listener)
    # ...
  end

  def process_message(arg0, message)
    # ...
  end
end

class Message
  attr_accessor :body
end
