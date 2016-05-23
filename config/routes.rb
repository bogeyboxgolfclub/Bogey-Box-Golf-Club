Rails.application.routes.draw do

  root 'pages#home'

  get 'boxes',                to: 'pages#boxes'
  get 'faq',                  to: 'pages#faq'
  get 'gift',                 to: 'pages#gift'
  get 'gift-a-box',           to: 'pages#giftbox'
  get 'gift-thank-you',       to: 'pages#thank_you_gift'
  get 'sign-up',              to: 'pages#signup'
  get 'success',              to: 'pages#success'
  post 'gift_submission',     to: 'gifters#gifting_submission'
  post 'typeform_submission', to: 'preferences#preference_submission'
                                   

  devise_for :users, :controllers => {:registrations => "registrations"}
  resources  :users
end
