class SlCallbacksController < ApplicationController

  # Disable CSRF
  skip_before_filter :verify_authenticity_token

  # Entry point
  def index
    if params[:type]
      case params[:type]
      when "incoming_message"
        incoming_message
      when "delivery_report"
        delivery_report
      else
        render :text => ""
      end
    else
      render :text => ""
    end
  end

  private
  
  # Processes the incoming message
  def incoming_message
    phone_number = params[:phone_number]
    body         = params[:body]

    render :text => handler.process(phone_number, body)
  end

  # Processes the delivery report
  def delivery_report
#    dlr_message_id = params[:message_id]
#    dlr_status     = params[:status]
#    dlr_final      = params[:final].to_i

#    LoftOwnerMessage.register_delivery_report(dlr_status, dlr_final, dlr_message_id)
    
    render :text => ""
  end
  
  # Returns the handler
  def handler
    @handler ||= MOHandler.new
  end
  
end
