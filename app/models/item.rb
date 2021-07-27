class Item < ApplicationRecord
  has_one_attached :image
  belongs_to :user
  has_many :rooms

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :delivery_area
  belongs_to :shipping_charge

  with_options presence: true do
    validates :product_name
    validates :image
    validates :product_descriiption
    validates :price, format: { with: /\A[0-9]+\z/ }
    with_options numericality: { other_than: 1 } do
      validates :shipping_charge_id
      validates :delivery_area_id
    end
  end

  validates_inclusion_of :price, in: 300..9_999_999
end
