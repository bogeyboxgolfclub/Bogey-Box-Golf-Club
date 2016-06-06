class Discount < ActiveRecord::Base
  validates_uniqueness_of :code

  def self.return_discount_code_amount(code)
    discount_code = Discount.find_by(code: code)
    if code.blank? or discount_code.blank?
      return "2000"
    else
      discount_code.amount
    end
  end

end
