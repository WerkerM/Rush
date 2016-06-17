module Api
  module V1
    class CoursesController < ApplicationController
      def index
        render json: Course.includes(:studio, :customers), include: ['studio']
      end

      def create
        new_course = Course.create!(course_params)
      end

      private

      def course_params
        ActiveModelSerializers::Deserialization.jsonapi_parse(params)
      end

      # private
      # def course_params
      #   params
      #     .require(:data)
      #     .require(:attributes)
      #     .permit(:title, :instructor, :description)
      # end
      #
      # def studio_params
      #   params
      #     .require(:data)
      #     .require(:relationships)
      #     .require(:studio)
      #     .require(:data)
      #     .permit(:id)
      # end
    end
  end
end
