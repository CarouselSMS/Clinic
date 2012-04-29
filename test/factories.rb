
#Factory.sequence(:login) {|n| "login_#{n}"}


Factory.define :message do |m|
  m.association           :conversation
  m.body                  Faker::Lorem.words(16)
end

Factory.define :incoming_message, :parent => :message do |m|
  m.incoming              1
end

Factory.define :outgoing_message, :parent => :message do |m|
  m.incoming              0
end

Factory.define :conversation do |c|
  c.title                 Faker::Lorem.words(16)
  c.phone_number          Faker::PhoneNumber.phone_number
end