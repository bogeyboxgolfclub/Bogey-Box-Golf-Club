class GiftersController < ApplicationController
  skip_before_filter :verify_authenticity_token, :only => [:gifting_submission]

  def gifting_submission
    Gifter.filter_gifter_submission(params)
  end

end
