module Api
  module V1
    class CoursesController < ApplicationController
      def index
        render json: Course.includes(:studio, :customers), include: ['studio']
      end

      def create
        new_course = Course.create!(course_params)
        render json: new_course
      end

      private

      def course_params
        ActiveModelSerializers::Deserialization.jsonapi_parse(params)
      end

    end
  end
end
