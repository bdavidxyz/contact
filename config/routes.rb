Rails.application.routes.draw do
  namespace :admin do
    resources :tags
    resources :leads
    root to: "leads#index"
    controller 'pages' do
      get 'load_csv' => "pages#load_csv_get"
      post 'load_csv' => "pages#load_csv_post"
    end

  end
end

