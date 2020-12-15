Rails.application.routes.draw do
  root to: "homes#index"
  devise_for :users, controllers: {
                       registrations: "users/registrations",
                       passwords: "users/passwords",
                     }
  devise_scope :user do
    post "users/guest_sign_in", to: "users/sessions#new_guest"
  end
  resource :receptions, only: [:edit, :show, :update, :destroy]
  resource :calendars, only: [:update, :edit]
  resources :notes
end
