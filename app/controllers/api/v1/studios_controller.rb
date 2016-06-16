
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
        studio = CreateStudio.call(studio_params, courses_params)
        render json: cocktail, include: ["proportions"]
      end

      private
      def studio_params
        params.require(:data).require(:attributes).permit(:name, :address)
      end

      def proportions_params
        params
          .require(:data)
          .require(:courses)
          .map { |course| proportion["data"]["attributes"]  }
      end
    end
  end
end
