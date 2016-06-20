module Api
  module V1
    class CustomersController < ApplicationController
      def index
        render json: Customer.includes(:courses, :studios), include: ['courses']
      end

      def create
        new_course = Customer.create!(customer_params)
      end

      private

      def customer_params
        ActiveModelSerializers::Deserialization.jsonapi_parse(params)
      end
    end
  end
end
