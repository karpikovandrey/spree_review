module Spree
  class Review < Spree::Base
    belongs_to :product

    after_create :calculate_rating

    AVAILABE_RAITING = ['1', '2', '3', '4', '5']

    validates :title, :description, :rating, presence: true, if: Proc.new{|item| item.with_review  }

    scope :approved, -> {where(approved: true)}
    scope :with_review, -> {where(with_review: true)}

    def calculate_rating
      value = Spree::Review.approved.where(product: product).average(:rating)
      product.update_column(:rating, value)
    end

  end
end
