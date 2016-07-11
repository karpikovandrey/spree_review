Spree::Product.class_eval do

  has_many :reviews, dependent: :destroy

  def update_rating(rating_item, type = 0)
      if type == 0
        new_rating = rating + rating_item
        new_count_voters = count_voters + 1
      else
        new_rating = rating - rating_item
        new_count_voters = count_voters - 1
      end
      update_columns({
                      rating: new_rating,
                      count_voters: new_count_voters,
                      average_rating: new_count_voters == 0 ? 0 : (new_rating.to_f/new_count_voters.to_f).round(1)
                     })
  end

end