Lotofacil::Application.routes.draw do
  namespace :loterias do
      resources :lotofacil do
        collection do
          get 'process_all_games'
          get 'latest'
        end
      end
  end
end
