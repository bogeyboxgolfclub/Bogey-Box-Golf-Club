class User < ActiveRecord::Base
  devise       :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable
  after_create :map_preference_to_user
  has_one      :preference


  def self.format_phone_number(number)
    ActiveSupport::NumberHelper.number_to_phone(number)
  end

  def self.generate_encrypted_password(size)
    SecureRandom.urlsafe_base64(n=size)
  end

  def map_preference_to_user
		if Preference.exists?(email: self.email)
    	Preference.where(email: self.email).first.update_attributes(user_id: self.id)
		else
			puts "Couldn't find preference for #{self.email}"
		end
  end

  def self.create_customer_in_stripe(params)
    customer = Stripe::Customer.create(
                :email =>  params[:stripeEmail],
                :source => params[:stripeToken])
    charge_customer_on_stripe(customer, params)
  end

  def self.charge_customer_on_stripe(customer, params)
    charge = Stripe::Charge.create(
              :customer =>    customer.id,
              :amount =>      params['user']['amount_paid'],
              :description => 'Bogeybox Golf Club Memebership Dues',
              :currency =>    'usd',
              :receipt_email => params[:stripeEmail])
    update_user_shipping_and_billing_details(params)
  end

  def self.update_user_shipping_and_billing_details(params)
    user = User.where(email: params[:stripeEmail]).first.update_attributes(
           stripe_card_token:                    params[:stripeToken],
           stripe_billing_address_line_1:        params[:stripeBillingAddressLine1],
           stripe_billing_address_zip:           params[:stripeBillingAddressZip],
           stripe_billing_address_state:         params[:stripeBillingAddressState],
           stripe_billing_address_city:          params[:stripeBillingAddressCity],
           stripe_billing_address_country_code:  params[:stripeBillingAddressCountryCode],
           stripe_shipping_name:                 params[:stripeShippingName],
           stripe_shipping_address_line_1:       params[:stripeShippingAddressLine1],
           stripe_shipping_address_zip:          params[:stripeShippingAddressZip],
           stripe_shipping_address_state:        params[:stripeShippingAddressState],
           stripe_shipping_address_city:         params[:stripeShippingAddressCity],
           stripe_shipping_address_country:      params[:stripeShippingAddressCountry],
           stripe_shipping_address_country_code: params[:stripeShippingAddressCountryCode])
  end

end
