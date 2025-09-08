Rails.application.routes.draw do
  devise_for :users
  authenticated :user do
    root to: "students#index", as: :authenticated_root   # pick a real page you have
  end

  devise_scope :user do
    unauthenticated do
      root to: "devise/sessions#new", as: :unauthenticated_root
    end
  end
end
