module Api
  module V1
    class CustomersController < ApplicationController
      def index
        render json: Customer.all
      end
    end
  end
end
