module Api
  module V1
    class UserController < ApplicationController
      skip_before_action :verify_authenticity_token

      def frames
        frames = Frame.where(status: 'active').order('created_at DESC')

        if frames.present?
          render status: 200, json: {
            frames: frames
          }
        else
          render status: 200, json: { errorCode: 1, errorMsg: 'No frames in the inventory' }
        end
      end

      def lens
        lens = Len.all.order('created_at DESC')

        if lens.present?
          render status: 200, json: {
            lens: lens
          }
        else
          render status: 200, json: { errorCode: 1, errorMsg: 'No lens in the inventory' }
        end
      end

      def add_to_cart
        error_message = Validators::ValidateParams.validate_add_cart_attributes(params)
        if error_message.present?
          render status: 422, json: { errorCode: 1, errorMsg: error_message }
          return
        end

        selected_frame = Frame.find_by_id(params[:frame_id].to_i)
        selected_lens = Len.find_by_id(params[:len_id].to_i)

        if selected_frame.blank? || selected_frame.stock.to_i <= 0
          render status: 200, json: { errorCode: 2, errorMsg: 'Selected Frame is out stock' }
        elsif selected_lens.blank? || selected_lens.stock.to_i <= 0
          render status: 200, json: { errorCode: 3, errorMsg: 'Selected Lens is out stock' }
        elsif already_in_cart?(params)
          render status: 200, json: { errorCode: 4, errorMsg: 'Glass is already in the cart' }
        else
          glass = Glass.create(add_cart_permitted_params)
          if glass.present?
            selected_frame.update(stock: selected_frame.stock.to_i - 1)
            selected_lens.update(stock: selected_lens.stock.to_i - 1)
            render status: 200, json: {
                     message: 'Glass created succesfully',
                     frame: selected_frame,
                     lens: selected_lens,
            }
          else
            render status: 422, json: { errorCode: 5, message: 'Something went wrong !!' }
          end
        end
      end

      def cart
        glasses = Glass.where("user_id = ?", params[:user_id])
        currency = Currency.where(name: User.find(params[:user_id]).currency).last

        cart_items = []
        glasses.each do |glass|
          item = {}
          item[:frame] = glass.frame
          item[:lens] = glass.len
          item[:price] = (glass.frame.price + glass.len.price) * currency.dollar_conversion_rate
          item[:currency] = currency.name

          cart_items << item
        end

        render status: 200, json: {
          message: 'Cart fetched succesfully',
          cart_items: cart_items
        }
      end

      private

      def add_cart_permitted_params
        params.permit(:frame_id, :len_id, :user_id)
      end

      def already_in_cart?(params)
        glass = Glass.where(frame_id: params[:frame_id], len_id: params[:len_id], user_id: params[:user_id]).last
        glass.present?
      end
    end
  end
end
