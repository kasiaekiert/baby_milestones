Rails.application.routes.draw do
  resource :session
  resources :milestones
  resources :children

  root "milestones#index"
end
