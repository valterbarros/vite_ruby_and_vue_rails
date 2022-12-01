class ApplicationController < ActionController::Base
  protect_from_forgery except: :index

  def index
    # binding.pry
    render inline: "inline code", layout: "layouts/application"
  end

  def get_assets
    # binding.pry
    pathname = request.url.split('nginx')[1]
    redirect_to('http://127.0.0.1:8082' + pathname, allow_other_host: true)
  end
end
