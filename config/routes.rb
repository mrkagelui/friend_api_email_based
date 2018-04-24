Rails.application.routes.draw do
  namespace :api, defaults: {format: :json}, path: '/api' do
    scope module: :v1, constraints: Constraint::Api_constraints.new(version: 1, default: true) do
      post 'add_friend', to: 'friendships#create'
    end
  end
end
