Rails.application.routes.draw do

  root 'pages#home'

  get 'boxes',   to: 'pages#boxes'
  get 'faq',     to: 'pages#faq'
  get 'gift',    to: 'pages#gift'
  get 'sign-up', to: 'pages#signup'
  get 'success',  to: 'pages#success'
  post 'typeform_submission', to: 'users#preference_submission'

  devise_for :users, :controllers => {:registrations => "registrations"}
  resources  :users

end
