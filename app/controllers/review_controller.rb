class ReviewsController < ApplicationController
    skip_before_action :verify_authenticity_token

    def index
        render json: Review.all
    end

    def show
        render json: Review.find(params[:id])
    end

    def create
        review = Review.new(review_params)
        if review.save
            render json: review, status: :created
        else
            render json: review.errors, status: :unprocessable_entity
        end
    end

    def update
        review = Review.find(params[:id])
        if review.update(review_params)
            render json: review, status: :ok
        else
            render json: review.errors, status: :unprocessable_entity
        end
    end

    def destroy
        Review.find(params[:id]).destroy!

        head :no_content
    end

    private

    def review_params
        p