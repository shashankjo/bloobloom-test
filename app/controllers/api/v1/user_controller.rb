module Api
  module V1
    class UserController < ApplicationController
      def frames
        frames = Frame.where(status: 'active').order('created_at DESC')

        if frames.present?
          render status: 200, json: {
            frames: frames
          }
        else
          render status: 200, json: { errorCode: 2, errorMsg: 'No frames in the inventory' }
        end
      end

      def lens
        lens = Len.all.order('created_at DESC')

        if lens.present?
          render status: 200, json: {
            lens: lens
          }
        else
          render status: 200, json: { errorCode: 2, errorMsg: 'No lens in the inventory' }
        end
      end

      def add_to_cart
        # remember to decrement the stock of frame and lens
      end

      def cart

      end

      private

    end
  end
end
