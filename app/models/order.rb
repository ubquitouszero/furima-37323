class Order
  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture_id, :city, :addresses, :building, :phone_number, :item_id, :user_id, :token

  with_options presence: { message: 'は入力必須項目です。' } do
    validates :postal_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'は、-（ハイフン）を含めた半角数字で入力してください。' }
    validates :prefecture_id, numericality: { other_than: 0, message: 'は入力必須項目です。' }
    validates :city
    validates :addresses
    validates :phone_number, format: { with: /\A[0-9]{10,11}+\z/, message: 'は10桁~11桁の半角数字で入力してください。-（ハイフン）は入力できません。' }
    validates :token
    validates :user_id
    validates :item_id
  end

  def save
    # 購入情報を保存し、変数sales_infoに代入する
    sales_info = SalesInfo.create(user_id: user_id, item_id: item_id)
    # 住所を保存する
    DeliveryInfo.create(postal_code: postal_code, prefecture_id: prefecture_id, addresses: addresses, city: city,
                        building: building, phone_number: phone_number, sales_info_id: sales_info.id)
  end
end
