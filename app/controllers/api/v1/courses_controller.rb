module Api
  module V1
    class CoursesController < ApplicationController
      def index
        render json: Course.includes(:studio, :customers)
      end
    end
  end
end
