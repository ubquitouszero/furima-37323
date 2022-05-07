class DeliveryInfo < ApplicationRecord
  # with_options presence: true do
  #   validates 
  #   validates    :postal_code
  #   validates    :prefecture_id
  #   validates    :city
  #   validates    :addresses
  #   validates    :phone_number
  #   validates    :sales_info
  # end

  belongs_to :sales_info

end
