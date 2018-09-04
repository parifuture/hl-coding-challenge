Rails.application.routes.draw do
  root to: "agents#random_agent"

  resources :agents do
    resource :uploaded_transactions do
      post :bulk_upload
    end
  end
end
