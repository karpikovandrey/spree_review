class Spree::ReviewsController < Spree::BaseController

  def create
    @review = Spree::Review.new(review_params)

    authorize! :create, @review

    if @review.save
      render :partial => 'spree/reviews/create/success'
    else
      render :partial => 'spree/reviews/create/error'
    end
  end

  def rating
    @review = Spree::Review.new(review_params)
    @review.approved = true
    authorize! :create, Spree::Review
    @review.save
  end

  private

  def review_params
    params.require(:review).permit(:title, :description, :product_id, :rating, :with_review)
  end
end