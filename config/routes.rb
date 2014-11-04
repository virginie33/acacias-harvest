Rails.application.routes.draw do

  scope "(:locale)" do
    resources :reports
    root to: 'welcome#index'
  end

end