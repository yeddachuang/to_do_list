Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :tasks do
    member do
      post :done, :as => :done
      post :undo, :as => :undo
    end
  end

  root "tasks#index"
end
