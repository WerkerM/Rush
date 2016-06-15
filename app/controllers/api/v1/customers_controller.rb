module Api
  module V1
    class CustomersController < ApplicationController
      def index
        render json: Customer.includes(:courses, :studios), include: ['courses']
      end
    end
  end
end
