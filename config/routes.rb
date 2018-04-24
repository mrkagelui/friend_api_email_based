Rails.application.routes.draw do
  namespace :api, defaults: {format: :json}, path: '/api' do
    scope module: :v1, constraints: Constraint::Api_constraints.new(version: 1, default: true) do
      post 'add_friend', to: 'friendships#create'
      get 'get_friends', to: 'friendships#get_friends'
      get 'get_common_friends', to: 'friendships#get_common_friends'
    end
  end
end
