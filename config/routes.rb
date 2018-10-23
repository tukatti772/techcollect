Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get 'home/search' => 'home#search'
  get 'home/wordsearch' => 'home#wordsearch'
  get 'home/blank' => 'home#blank'
  get 'home/indexbookmark' => 'home#indexbookmark'
  get 'home/indexcomment' => 'home#indexcomment'
  get 'home/taglist' => 'home#taglist'
  get 'home/regulation' => 'home#regulation'
  get 'home/contact' => 'home#contact'
  get 'home/about' => 'home#about'

  #userのブックマーク一覧へのリンク
  resources :users, only: [:bookmark,:comment] do
    get :bookmark
    get :comment
  end

  resources :users, only: [:show]
  resources :home, only: [:index,:show]
  resources :comment, only: [:destroy]

  #ブックマーク機能用。paramsを渡すため・・
  resources :home, only: [:bookmark,:unbookmark] do
    post :bookmark
    delete :unbookmark
  end

  resources :home do
    resources :comment, only: [:create]
  end



  root 'home#index'

end
