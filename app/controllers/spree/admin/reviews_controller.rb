module Spree
  module Admin
    class ReviewsController < Spree::Admin::BaseController
      before_filter :load_review, only: [:edit, :update]

      def index
        @reviews = Review.with_review.order('created_at DESC').page(params[:page]).
          per(params[:per_page] || Spree::Config[:orders_per_page])

        authorize! :manage, @reviews
      end

      def edit
        authorize! :edit, @review
      end

      def update
        authorize! :update, @review
        if @review.update(review_params)
          @review.calculate_rating if @review.previous_changes[:approved]
          redirect_to action: :index
        else
          render action: :edit
        end
      end

      private

      def load_review
        @review = Spree::Review.find(params[:id])
      end

      def review_params
        params.require(:review).permit(:title, :description, :approved)
      end

    end
  end
end