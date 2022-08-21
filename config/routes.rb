Rails.application.routes.draw do
  defaults format: :json do
    #consider adding api namespace
    post 'posts/create'
    get 'posts/rate'
    get 'posts/top'
    get 'posts/list_ips'
  end
end
