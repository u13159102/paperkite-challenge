Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'vendors#show'

  scope '/api', api_version: '1' do
    get 'vendor/:outlet', to: 'vendors#show'
    get 'vendor/:outlet/promos', to: 'vendors#promos'
    get 'vendor/:outlet/promos/:promo_id', to: 'vendors#show_promo'
  end

  get 'vendor/:outlet', to: 'vendors#show', as: :vendor
  get 'vendor/:outlet/promos', to: 'vendors#promos', as: :vendor_promos
  get 'vendor/:outlet/promos/:promo_id', to: 'vendors#show_promo', as: :vendor_promo
end
