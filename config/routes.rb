Rails.application.routes.draw do
  devise_for :users

  resources :progress_entry, :goal, :student, :accommodation

  authenticated :user do
    root to: "students#index", as: :authenticated_root
  end

  devise_scope :user do
    unauthenticated do
      root to: "devise/sessions#new", as: :unauthenticated_root
    end
  end
end
