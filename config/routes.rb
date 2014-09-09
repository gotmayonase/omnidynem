Thumpdump::Application.routes.draw do
  root 'home#index'

  post '/' => 'home#index'

  resources :recipes do
    post 'import', on: :collection
  end

  resources :items do
    post 'import', on: :collection
  end

  resources :certifications do
    post 'import', on: :collection
  end

end
