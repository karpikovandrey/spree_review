class Spree::ReviewsController < Spree::BaseController

  def create
    @review = Spree::Review.new(review_params)

    authorize! :create, @review

    if @review.save
      render partial: 'spree/reviews/create/success'
    else
      render partial: 'spree/reviews/create/error'
    end
  end

  def rating
    authorize! :rating, Spree::Review
    product = Spree::Product.find(params[:product_id])
    product.update_rating(params[:rating].to_i, 0)
    render :json => {status: 'ok', message: Spree.t('frontend.reviews.success_make_fast_rating')}
  end

  private

  def review_params
    params.require(:review).permit(:title, :description, :product_id, :rating)
  end
end