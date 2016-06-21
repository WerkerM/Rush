
module Api
  module V1
    class StudiosController < ApplicationController
      def index
        render json: Studio.includes(:courses, :customers), include: ['courses']
      end

      def show
        render json: Studio.includes(:courses, :customers).find_by(id: params[:id]), include: ['courses']
      end

      def create
        studio = Studio.create!(studio_params)
        render json: studio
      end

      private
      def studio_params
        ActiveModelSerializers::Deserialization.jsonapi_parse(params)
      end

    end
  end
end
