class GiftRecipient < ActiveRecord::Base
  belongs_to :gifter
  has_one    :preference

  def self.register_gift_recipient(answers, gifter)
    GiftRecipient.find_or_create_by(
      first_name:                  answers['textfield_22481984'],
      last_name:                   answers['textfield_22481985'],
      shipping_address_line_1:     answers['textfield_22487392'],
      shipping_address_zip:        answers['textfield_22487467'],
      shipping_address_line_state: answers['textfield_22487462'],
      shipping_address_city:       answers['textfield_22487444'],
      shipping_address_country:    'United States',
      gifter_id:                   gifter.id)
  end

end
