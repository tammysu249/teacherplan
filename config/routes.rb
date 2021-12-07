Rails.application.routes.draw do
  resources :plan_comments
  resources :goals_comments
  resources :action_steps
  resources :goals
  resources :invites
  resources :improvement_plans
  devise_for :teachers
  resources :teachers
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
