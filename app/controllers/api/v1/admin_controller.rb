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
        error_message = Validators::ValidateParams.validate_lens_attributes(params)
        if error_message.present?
          render status: 422, json: { errorCode: 1, errorMsg: error_message }
          return
        end

        lens = Len.create(lens_permitted_params)
        if lens.present?
          render status: 200, json: { message: 'Lens created succesfully' }
        else
          render status: 422, json: { errorCode: 2, message: 'Something went wrong !!' }
        end
      end

      def delete_frame
        frame = Frame.find_by_id(params[:frame_id])

        if frame.present?
          frame.destroy
          render status: 200, json: { message: 'Frame deleted succesfully' }
        else
          render status: 200, json: { errorCode: 1, message: 'Frame you are trying to delete does not exist' }
        end
      end

      def delete_lens
        lens = Len.find_by_id(params[:lens_id])

        if lens.present?
          lens.destroy
          render status: 200, json: { message: 'Lens deleted succesfully' }
        else
          render status: 200, json: { errorCode: 1, message: 'Lens you are trying to delete does not exist' }
        end
      end

      private

      def frame_permitted_params
        params.permit(:name, :description, :status, :stock, :price)
      end

      def lens_permitted_params
        params.permit(:color, :description, :prescription_type, :lens_type, :stock, :price)
      end
    end
  end
end
