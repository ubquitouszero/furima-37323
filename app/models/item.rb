class Item < ApplicationRecord
  belongs_to :user
  # has_one :sales_info
  has_one_attached :image



  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :sales_status
  belongs_to :fee_status
  belongs_to :prefecture
  belongs_to :delivery_schedule

  #空の投稿を保存できないようにする
  validates :name, :info, :category_id, :sales_status_id, :fee_status_id, :prefecture_id, :delivery_schedule_id, :image, presence: true
  with_options format: { with: /\A[0-9]+\z/ } do
    validates_inclusion_of :price, in:300..9999999, message: "は半角数字で、¥300~¥9,999,999の範囲で入力してください", presence: true
  end

  #ジャンルの選択が「--」の時は保存できないようにする
  validates :category_id, numericality: { other_than: 1 , message: "please select category"}
  validates :sales_status_id, numericality: { other_than: 1 , message: "please select sales satatus"}
  validates :fee_status_id, numericality: { other_than: 1 , message: "please select fee method"}
  validates :prefecture_id, numericality: { other_than: 1 , message: "please select prefecture"}
  validates :delivery_schedule_id, numericality: { other_than: 1 , message: "please select delivery schedule"}



end
