class ApplicationController < ActionController::Base
  include ActionController::HttpAuthentication::Token::ControllerMethods

  protected

  def authenticate
    user = User.find_by(api_key: params[:api_key])
    
    if user
      authenticate_token
    else
      render_unauthorized 
    end
  end
  
  def authenticate_token
    authenticate_with_http_token
  end

  def render_unauthorized(realm = "Application")
    self.headers["WWW-Authenticate"] = %(Token realm="#{realm}")
    render json: 'Bad credentials', status: :unauthorized
  end
end