module Api
  module Validators
    class ValidateParams
      def self.validate_frames_attributes(params)
        return 'Please enter name of the frame' if params[:name].blank?
        return 'Please enter status of the frame' if params[:status].blank?
        return 'Please enter stock of the frame' if params[:stock].blank?
        return 'Please enter stock as an Integer greater than 0' if params[:stock].to_i == 0
        return 'Invalid frame status' unless Frame::VALID_STATUSES.include?(params[:status].strip)

        nil
      end

      def self.validate_lens_attributes(params)
        return 'Please enter color of the frame' if params[:color].blank?
        return 'Please enter prescription_type of the frame' if params[:prescription_type].blank?
        return 'Please enter lens_type of the frame' if params[:prescription_type].blank?
        return 'Please enter stock of the frame' if params[:lens_type].blank?
        return 'Please enter stock as an Integer greater than 0' if params[:stock].to_i == 0
        return 'Invalid lens prescription_type' unless Len::PRESCRIPTION_TYPE.include?(params[:prescription_type].strip)
        return 'Invalid lens lens_type' unless Len::LENS_TYPE.include?(params[:lens_type].strip)

        nil
      end

      def self.validate_add_cart_attributes(params)
        return 'Please enter frame_id of the frame' if params[:frame_id].blank?
        return 'Please enter lens_id of the frame' if params[:len_id].blank?
        return 'Please enter user_id of the frame' if params[:user_id].blank?

        nil
      end
    end
  end
end