class RegistrationsController < Devise::RegistrationsController
  def new
    @title = 'Join The Club'
    build_resource({})
    set_minimum_password_length
    yield resource if block_given?
    respond_with self.resource
  end

  def create
    build_resource(sign_up_params)
    customer = Stripe::Customer.create(:email => params[:stripeEmail], :source  => params[:stripeToken])
    charge = Stripe::Charge.create(:customer    => customer.id,
                                   :amount      => 100,
                                   :description => 'Bogeybox Golf Club Memebership Dues',
                                   :currency    => 'usd')

    resource.update_attributes stripe_card_token: params[:stripeToken]
    resource.save
    yield resource if block_given?
    if resource.persisted?
      if resource.active_for_authentication?
        set_flash_message! :notice, :signed_up
        sign_up(resource_name, resource)
      else
        set_flash_message! :notice, :"signed_up_but_#{resource.inactive_message}"
        expire_data_after_sign_in!
        respond_with resource, location: after_inactive_sign_up_path_for(resource)
      end
      Preference.pull_style_preference_from_typeform(resource)
      respond_with resource, location: user_path(resource)
      User.send_initial_text_message(resource)
    else
      clean_up_passwords resource
      set_minimum_password_length
    end
  end

  def update
    super
  end
end
