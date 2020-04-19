class ApplicationController < ActionController::Base
  include ActionController::HttpAuthentication::Token::ControllerMethods

  protected

  def authenticate
    authenticate_token || render_unauthorized
  end

  def authenticate_token
    authenticate_with_http_token do |token, options|
      @current_user = User.find_by(api_key: token)
    end
  end

  def render_unauthorized(realm = "Application")
    self.params["api_key"] = %(Token realm="#{realm}")
    render json: 'Bad credentials', status: :unauthorized
  end
end