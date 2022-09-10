Rails.application.routes.draw do

  get '/status', to: proc { [200, {}, ['OK']] }

  namespace :api, :path => "", :defaults => {:format => :json} do
    namespace :v1 do
      get "user/frames",             to: "user#frames"
      post "admin/create_frame",     to: "admin#create_frame"
      post "admin/delete_frame",     to: "admin#delete_frame"

      post "admin/create_lens",     to: "admin#create_lens"
      post "admin/delete_lens",     to: "admin#delete_lens"

      post "user/add_to_cart",      to: "user#add_to_cart"
      get "user/cart",              to: "user#cart"
    end
  end
end