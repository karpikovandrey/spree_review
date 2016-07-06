Spree::Product.class_eval do

  has_many :reviews, dependent: :destroy

end