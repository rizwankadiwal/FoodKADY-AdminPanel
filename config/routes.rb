Rails.application.routes.draw do

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  scope '/admin' do
    resources :categories
    resources :products do
      collection {post :import}
    end
    get '', to: 'dashboard#admin'
  end
end
