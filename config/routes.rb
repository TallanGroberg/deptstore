Rails.application.routes.draw do
  root 'shops#index'

  resources :shops do
    resources :depts
  end
end
