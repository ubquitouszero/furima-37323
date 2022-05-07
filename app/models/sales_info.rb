class SalesInfo < ApplicationRecord
  # with_options presence: true do
  #   validates    :user_id
  #   validates    :item_id
  #   validates    :delivery_info_id
  # end

  belongs_to :user
  has_one :delivery_info
end
