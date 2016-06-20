class ApplicationController < ActionController::API
  before_action :authenticate

  def logged_in?
    !!current_customer
  end

  def current_customer
    if auth_present?
      customer = Customer.find(auth["customer"])
      if customer
        @current_customer ||= customer
      end
    end
  end

  def authenticate
    render json: {error: "unauthorized"}, status: 404 unless logged_in?
  end

  private

  def token
    request.env["HTTP_AUTHORIZATION"].scan(/Bearer(.*)$/).flatten.last
  end

  def auth
    Auth.decode(token)
  end

  def auth_present?
    !!request.env.fetch("HTTP_AUTHORIZATION", "").scan(/Bearer/).flatten.first
  end

end
