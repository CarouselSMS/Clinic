class MessagesController < ApplicationController
  inherit_resources
  belongs_to :conversation

  def create
    create! do |success, failure|
      success.html {redirect_to conversation_url(resource.conversation)}
      success.js
    end
  end

  def index
    render :partial => 'conversation', :locals => {:messages => collection}, :layout => false
  end
end
