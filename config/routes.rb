Rails.application.routes.draw do
  resources :users, only: [:index, :create, :destroy, :show]
  resources :job_applications, only: [:index, :create, :destroy]
end
