Rails.application.routes.draw do
  root to: "homes#index"
  devise_for :users, controllers: {
                       registrations: "users/registrations",
                       passwords: "users/passwords",
                     }
  # post "/homes/guest_sign_in", to: "homes#new_guest"
  devise_scope :user do
    post "users/guest_sign_in", to: "users/sessions#new_guest"
  end
end
