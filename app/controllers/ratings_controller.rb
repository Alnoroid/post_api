class RatingsController < ApplicationController
  def create
    rating = Rating.new(rating_params)
    if rating.save
      average_rating = rating.post.get_rating
      render json: {average_rating: average_rating}, status: :created
    else
      render json: { errors: rating.errors }, status: :unprocessable_entity
    end
  end

  private

  def rating_params
    params.require(:rating).permit(:post_id, :user_id, :value)
  end
end
