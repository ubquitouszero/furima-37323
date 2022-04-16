class Item < ApplicationRecord
  
  belongs_to :user
  # has_one :sales_info
  has_one_attached :image

  #空の投稿を保存できないようにする
  validates :name, presence: { message: "は入力必須項目です。" }
  validates :info, presence: { message: "は入力必須項目です。" }
  validates :category_id, presence: { message: "は入力必須項目です。" }
  validates :sales_status_id, presence: { message: "は入力必須項目です。" }
  validates :fee_status_id, presence: { message: "は入力必須項目です。" }
  validates :prefecture_id, presence: { message: "は入力必須項目です。" }
  validates :delivery_schedule_id, presence: { message: "は入力必須項目です。" }
  validates :image, presence: { message: "は添付必須項目です。" }
  with_options format: { with: /\A[0-9]+\z/ } do
    validates_inclusion_of :price, in:300..9999999, message: "は半角数字で、¥300~¥9,999,999の範囲で入力してください", presence: true
  end

  #ジャンルの選択が「--」の時は保存できないようにする
  validates :category_id, numericality: { other_than: 0 , message: "は入力必須項目です。"}
  validates :sales_status_id, numericality: { other_than: 0 , message: "は入力必須項目です。"}
  validates :fee_status_id, numericality: { other_than: 0 , message: "は入力必須項目です。"}
  validates :prefecture_id, numericality: { other_than: 0 , message: "は入力必須項目です。"}
  validates :delivery_schedule_id, numericality: { other_than: 0 , message: "は入力必須項目です。"}
  
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :sales_status
  belongs_to :fee_status
  belongs_to :prefecture
  belongs_to :delivery_schedule

end
