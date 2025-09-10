Rails.application.routes.draw do
  devise_for :users
  root to: "students#index"

  resources :goals, :accommodations
  resources :students do
    resources :student_goals, only: [:new, :create, :show, :destroy] do
      resources :progress_entries, only: [:create, :destroy]
    end
    resources :student_accommodations, only: [:new, :create, :show, :destroy]
  end

  authenticated :user do
    root to: "students#index", as: :authenticated_root
  end

  devise_scope :user do
    unauthenticated do
      root to: "devise/sessions#new", as: :unauthenticated_root
    end
  end
end
