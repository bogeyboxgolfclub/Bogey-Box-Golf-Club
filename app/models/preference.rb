class Preference < ActiveRecord::Base
  belongs_to :user
  belongs_to :gift_recipient


  def self.filter_preferences(params)
    answers = HTTParty.get("https://api.typeform.com/v0/form/Ugamap?key=#{ENV['typeform_key']}&token=#{params['form_response']['token']}").parsed_response['responses'][0]['answers']
    create_preferences_for_user(answers)
  end

  def self.create_preferences_for_user(answers)
    Preference.create(
      style_on_course:        answers['listimage_21263859_choice'],
      dress_for_work:         answers['listimage_21263860_choice'],
      shirt_fit:              answers['listimage_21263861_choice'],
      pant_fit:               answers['listimage_21263862_choice'],
      shirt_size:             answers['list_21263863_choice'],
      waist_size:             answers['list_21263864_choice'],
      pant_length:            answers['list_21263865_choice'],
      philosophy_on_clothing: answers['list_21263866_choice'],
      email:                  answers['email_21263871'])
  end

end
