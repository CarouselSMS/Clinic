class MOHandler
  
  UNKNOWN_NUMBER_RESPONSE   = "Sorry, we don't know who you are."
  
  # Processing entry point
  def process(phone, body)
    phone = SmsToolkit::PhoneNumbers.normalize(phone)

    # try to find active conversation
    conversation = Conversation.active.find_by_phone_number(phone)
    message = Message.new({:body => body, :incoming => true})

    response = ''

    if conversation.nil?
      conversation = Conversation.create({:phone_number => phone, :title => body, :active => true})
      response = 'Welcome message'
    end
    
    conversation.messages << message

    response
  end
  
end