class Preference < ActiveRecord::Base
  belongs_to :user
  belongs_to :gift_recipient


  def self.filter_preferences(params)
    answers = HTTParty.get("https://api.typeform.com/v0/form/BFdO9W?key=#{ENV['typeform_key']}&token=#{params['form_response']['token']}").parsed_response['responses'][0]['answers']
    create_preferences_for_user(answers)
  end

  def self.create_preferences_for_user(answers)
    Preference.create(
      style_on_course:        answers['listimage_40419493_choice'],
      dress_for_work:         answers['listimage_40419494_choice'],
      shirt_fit:              answers['listimage_40419491_choice'],
      pant_fit:               answers['listimage_40419492_choice'],
      shirt_size:             answers['list_40419481_choice'],
      waist_size:             answers['list_40419482_choice'],
      pant_length:            answers['list_40419483_choice'],
      email:                  answers['email_40419504'])
  end

end
