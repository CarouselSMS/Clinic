require 'test_helper'

class MessageTest < ActiveSupport::TestCase
  should_belong_to :conversation
  should_validate_presence_of :body
end
