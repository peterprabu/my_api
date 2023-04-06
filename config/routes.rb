Rails.application.routes.draw do
  post '/signup', to: 'users#signup'
  get '/login', to: 'users#login'

  post '/shorten', to: 'links#shorten'
  get '/:short_url', to: 'links#redirect'
end
