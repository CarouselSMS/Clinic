class MessageObserver < ActiveRecord::Observer

  def after_create(message)
    Messanger.new.deliver_message(message)
  end

end
