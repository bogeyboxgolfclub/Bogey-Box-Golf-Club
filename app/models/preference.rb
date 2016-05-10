class Preference < ActiveRecord::Base
  belongs_to :user

  def self.pull_style_preference_from_typeform(resource)
    user = User.find(resource.id)
    submissions = HTTParty.get("https://api.typeform.com/v0/form/Ugamap?key=#{ENV['typeform_key']}&completed=true").parsed_response['responses'].each do |response|
      if response['answers']['email_21263871'].include? user.email
        Preference.find_or_create_by!(style_on_course: response['answers']['listimage_21263859_choice'],
                                      dress_for_work: response['answers']['listimage_21263860_choice'],
                                      shirt_fit: response['answers']['listimage_21263861_choice'],
                                      pant_fit: response['answers']['listimage_21263862_choice'],
                                      shirt_size: response['answers']['list_21263863_choice'],
                                      waist_size: response['answers']['list_21263864_choice'],
                                      pant_length: response['answers']['list_21263865_choice'],
                                      philosophy_on_clothing: response['answers']['list_21263866_choice'],
                                      user_id: user .id)
      end
    end
  end

end
