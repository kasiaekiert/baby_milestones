Rails.application.routes.draw do
  resource :session, only: %i[ new destroy ]
  resources :milestones
  resources :children

  root "milestones#index"
end
