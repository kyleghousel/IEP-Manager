Rails.application.routes.draw do
  devise_for :users

  resources :progress_entries, :goals, :students, :accommodations

  authenticated :user do
    root to: "students#index", as: :authenticated_root
  end

  devise_scope :user do
    unauthenticated do
      root to: "devise/sessions#new", as: :unauthenticated_root
    end
  end
end
