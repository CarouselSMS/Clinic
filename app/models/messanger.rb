class Messanger

  # Delivers the private message to the lo
  def deliver_message(message)
    return if message.body.blank? || message.incoming?

    phone = message.conversation.phone_number
    return if phone.blank?

    sl.send_message(phone, message.body.strip)
  end

  private

  # Returns SL instance
  def sl
    @sl ||= ServiceLayer.new
  end
  
end