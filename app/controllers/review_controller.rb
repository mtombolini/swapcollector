class ReviewController < ApplicationController
    before_action :set_review, only: [:show, :destroy, :edit, :update]

    def index
        @reviews = Review.all
    end

    def show
        review = Review.find(params[:id])
    end

    def new
        @review = Review.new
    end

    def create
        @review = Review.new(review_params)
        @review.user = current_user

        if @review.save
            redirect_to @review, notice: 'Rview creada'
        else
            render :new
        end
    end

    def edit 
        if @review.user != current_user
            redirect_to root_path, alert: 'No puedes editar esta resena'
        else
            render :edit
        end
    end

    def update
        if @review.update(review_params)
            redirect_to @review, notice: 'Review actualizada'
        else
            render :edit
        end
    end


    def destroy
        @review.destroy
        redirect_to review_path, notice: 'Review eliminada'
    end

    private


    def review_params
        params.require(:review).permit(:rating, :body)
    end
end
