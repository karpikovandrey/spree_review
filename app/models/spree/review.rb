module Spree
  class Review < Spree::Base
    belongs_to :product

    after_save :calculate_rating

    AVAILABE_RAITING = ['1', '2', '3', '4', '5']

    validates :title, :description, :rating, presence: true

    scope :approved, -> {where(approved: true)}

    def calculate_rating
      if approved_changed?
        if approved
          product.update_rating(rating, 0)
        else
          product.update_rating(rating, 1)
        end
      end
    end

  end
end
