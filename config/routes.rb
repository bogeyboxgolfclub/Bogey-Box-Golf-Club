Rails.application.routes.draw do

  root 'pages#home'

  get 'boxes',   to: 'pages#boxes'
  get 'faq',     to: 'pages#faq'
  get 'gift',    to: 'pages#gift'
  get 'sign-up', to: 'pages#signup'
  get 'success',  to: 'pages#success'

  devise_for :users, :controllers => {:registrations => "registrations"}
  resources  :users, :only => [:show]

end
