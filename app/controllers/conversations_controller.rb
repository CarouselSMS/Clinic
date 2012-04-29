class ConversationsController < ApplicationController
  inherit_resources

  def collection
    @collection = Conversation.active(:all, :order => "updated_at DESC")
  end
end
