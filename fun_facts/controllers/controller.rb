require './config/environment'
require './app/models/sample_model'

class Applications < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do
    return erb :index
  end
  
  post '/' do
    @the_fortune = get_fortune
    @the_user = params[:user]
    return erb :results
  end
end