Rails.application.routes.draw do
  defaults format: :json do
    #consider adding api namespace
    # posts
    post 'posts', to: 'posts#create', as: :create_post
    get 'posts/top/:posts_count', to: 'posts#top', as: :top_posts

    # ratings
    post 'ratings', to: 'ratings#create', as: :create_rating

    # users
    get 'users/ips', to: 'users#ips', as: :list_ips
  end
end
