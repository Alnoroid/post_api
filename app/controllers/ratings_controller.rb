class RatingsController < ApplicationController
  def create
    rating = Rating.new(rating_params)
    if rating.save
      render json: rating.to_json, status: 201
    else
      render json: { errors: rating.errors }, status: 422
    end
  end

  private

  def rating_params
    params.require(:rating).permit(:post_id, :user_id, :value)
  end
end
