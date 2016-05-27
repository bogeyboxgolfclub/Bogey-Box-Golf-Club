class PagesController < ApplicationController

  def home
    @title = 'Home'
  end

  def boxes
    @title = 'Boxes'
  end

  def faq
    @title = 'Frequently Asked Questions'
  end

  def gift
    @title = 'Gift A Bogeybox'
  end

  def giftbox
    @title = 'Gift Bogeybox Registration'
  end

  def gift_checkout
    @title = 'Gift Box Checkout'
  end

  def thank_you_gift
    @title = 'Thank You For Choosing Bogeybox'
  end

  def signup
    @title = 'Join The Club'
  end

  def success
    @title = 'Welcome To The Club'
  end

end
