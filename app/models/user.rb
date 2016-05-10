class User < ActiveRecord::Base
  devise :database_authenticatable,
         :registerable,
         :recoverable,
         :rememberable,
         :trackable,
         :validatable
  has_one :preference

  def self.format_phone_number(number)
    ActiveSupport::NumberHelper.number_to_phone(number)
  end

  def self.send_initial_text_message(resource)
    @client = Twilio::REST::Client.new
    @client.messages.create(from:      ENV['twilio_number'],
                            to:        "+1#{resource.phone}",
                            body:      "#{resource.first_name}, this is Nik, your Bogeybox Golf Pro. I wanted to welcome you to the club; I'm excited to get started on your preview box.")
    @client.messages.create(from: ENV['twilio_number'],
                            to: "+1#{resource.phone}",
                            body: "I noticed you listed a waist size of #{resource.preference.waist_size}, and a pant length of #{resource.preference.pant_length}. Would love to hop on a call some day soon. When are you free?")
  end

end
