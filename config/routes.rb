Rails.application.routes.draw do
  get 'landing/index'

  get '/' => 'landing#without_locale', as: :root_without_locale

  scope '/:locale' do
    devise_for :users
    get '/' => 'landing#index', as: :root
    get '/users/' => 'landing#users_signup_redirect', as: :users_signup_redirect
    resources :user, only: :show
  end
end
