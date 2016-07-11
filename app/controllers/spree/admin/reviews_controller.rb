module Spree
  module Admin
    class ReviewsController < Spree::Admin::BaseController
      before_action :load_review, only: [:edit, :update]

      def index
        @reviews = Review.order(created_at: :desc).page(params[:page]).
          per(params[:per_page] || Spree::Config[:orders_per_page])

        authorize! :manage, @reviews
      end

      def edit
        authorize! :edit, @review
      end

      def update
        authorize! :update, @review
        if @review.update(review_params)
          redirect_to action: :index
        else
          render action: :edit
        end
      end

      private

      def load_review
        @review = Spree::Review.find_by_id(params[:id])
        unless @review
          flash.notice = "Item not exist"
          redirect_to admin_reviews_url and return
        end
      end

      def review_params
        params.require(:review).permit(:title, :description, :approved)
      end

    end
  end
end