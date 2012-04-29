require 'test_helper'

class ConversationTest < ActiveSupport::TestCase
  should_have_many :messages
  should_validate_presence_of :phone_number
end
