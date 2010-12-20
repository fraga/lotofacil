Lotofacil::Application.routes.draw do
  namespace :loterias do
      resources :lotofacil do
        collection do
          get 'latest'
        end
      end
  end
end
