module Api
  module Validators
    class ValidateParams
      def self.validate_frames_attributes(params)
        return 'Please enter name of the frame' if params[:name].blank?
        return 'Please enter status of the frame' if params[:status].blank?
        return 'Please enter stock of the frame' if params[:stock].blank?
        return 'Please enter stock as an Integer greater than 0' if params[:stock].to_i == 0
        return 'Invalid frame status' unless VALID_STATUSES.include?(params[:status].strip)

        nil
      end
    end
  end
end