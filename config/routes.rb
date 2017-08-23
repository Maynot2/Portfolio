Rails.application.routes.draw do

  root "pages#home"

  get '/about',   to: 'pages#about'
  get '/contact', to: 'pages#contact'

  resources :portfolios, except: [:show, :new, :edit]
  get 'portfolio/new',      to: 'portfolios#new',  as: 'new_portfolio'
  get 'portfolio/:id',      to: 'portfolios#show', as: 'portfolio_show'
  get 'portfolio/:id/edit', to: 'portfolios#edit', as: 'edit_portfolio'

  resources :blogs do
    member do
      get :toggle_status
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
