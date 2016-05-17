class Gifter < ActiveRecord::Base
  has_one :gift_recipient

  def self.filter_gifter_submission(params)
    answers = HTTParty.get("https://api.typeform.com/v0/form/mwYgaJ?key=#{ENV['typeform_key']}&token=#{params['form_response']['token']}").parsed_response['responses'][0]['answers']
    register_gifter(answers, params)
  end

  def self.register_gifter(answers, params)
    gifter = Gifter.find_or_create_by(
              first_name:             answers['textfield_22481986'],
              last_name:              answers['textfield_22481987'],
              email:                  answers['email_22481993'],
              phone:                  answers['textfield_22481988'],
              best_contact_method:    answers['list_22481991_choice'],
              best_time_of_day:       answers['list_22481992_choice'],
              product_option:         answers['listimage_22539332_choice'],
              typeform_submission_id: params['form_response']['token'])
    GiftRecipient.register_gift_recipient(answers, gifter)
  end

end
