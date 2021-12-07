Rails.application.routes.draw do
  scope path: ApplicationResource.endpoint_namespace, defaults: { format: :jsonapi } do
    scope module: 'api/v1', as: 'api' do
      resources :plan_comments

      resources :goals_comments

      resources :action_steps

      resources :goals

      resources :invites

      resources :improvement_plans

      resources :teachers

    end
    mount VandalUi::Engine, at: '/vandal'
    # your routes go here
  end
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  root :to => "improvement_plans#index"
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
