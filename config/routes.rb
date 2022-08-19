Rails.application.routes.draw do
  post 'posts/create'
  get 'posts/rate'
  get 'posts/top'
  get 'posts/get_by_ip'
end
