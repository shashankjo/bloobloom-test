module Api
  module V1
    class AdminController < ApplicationController
      skip_before_action :verify_authenticity_token

      def create_frame
        error_message = Validators::ValidateParams.validate_frames_attributes(params)
        if error_message.present?
          render status: 422, json: { errorCode: 1, errorMsg: error_message }
          return
        end

        frame = Frame.create(frame_permitted_params)
        if frame.present?
          render status: 200, json: { message: 'Frame created succesfully' }
        else
          render status: 422, json: { message: 'Something went wrong !!' }
        end
      end

      def create_lens

      end

      def delete_frame
        Frame.destroy(params[:frame_id])

        render status: 200, json: { message: 'Frame deleted succesfully' }
      end

      def delete_lens
        Len.destroy(params[:lens_id])

        render status: 200, json: { message: 'Lens deleted succesfully' }
      end

      private

      def frame_permitted_params
        params.permit(:name, :description, :status, :stock, :price)
      end
    end
  end
end
