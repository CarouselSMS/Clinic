class Conversation < ActiveRecord::Base
  has_many :messages, :order => 'created_at ASC'
  validates_presence_of   :phone_number

  named_scope :active, :conditions => {:active => true}

  def phone_number_formatted
    SmsToolkit::PhoneNumbers::format(self.phone_number)
  end
end
