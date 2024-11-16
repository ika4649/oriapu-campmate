Rails.application.routes.draw do
  devise_for :users

  # ログインページをルートパスに設定
  devise_scope :user do
    root to: "devise/sessions#new"
  end

  # トップページへのルート設定
  get 'tops/index', to: 'tops#index', as: 'top'
end