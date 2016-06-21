module Api
  module V1
    class SessionsController < ApplicationController
      # skip_before_action :authenticate, only: [:create]
      def create
        customer = Customer.find_by(email: auth_params[:email])
        if customer && customer.authenticate(auth_params[:password])
          jwt = Auth.issue({customer: customer.id})
          render json: {jwt: jwt}
        else
          render json: {:errors=>
            [{:detail=>"incorrect email or password",
              :source=>{:pointer=>"customer/err_type"}
            }]
          }, status: 404
        end
      end

      private
        def auth_params
          params.require(:auth).permit(:email, :password)
        end
    end
  end
end
