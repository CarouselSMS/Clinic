require 'test_helper'

class MOHandlerTest < ActiveSupport::TestCase

  def setup
    @mh = MOHandler.new
  end
  
  context "receiving new message" do
    setup do
      @previous_conversation_id = Conversation.all.last.object_id || 0
      phone_number = '8000000'
      body = Faker::Lorem.sentence(10)
      @mh.process(phone_number, body)
    end
    
    should "create new conversation" do
      @last_conversation = Conversation.all.last
      assert_not_equal @previous_conversation_id, @last_conversation.id
    end
  end

  context "receiving followup message" do
    setup do
      phone_number = '5550000'
      @conversation = Factory(:conversation, :phone_number => phone_number)
      body = Faker::Lorem.sentence(10)
      @mh.process(phone_number, body)
    end

    should "follow conversation" do
      @last_message = Message.all.last
      assert_equal @conversation, @last_message.conversation
    end
  end
end