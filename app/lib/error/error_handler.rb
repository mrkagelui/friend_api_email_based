module Error
  module ErrorHandler
    def self.included(myClass)
      myClass.class_eval do
        rescue_from ActiveRecord::RecordInvalid, with: :record_invalid
      end
    end

    private

    def record_invalid(err)
      render json: {status: :bad_request, error: err.to_s, message: 'Invalid parameter'}, status: :bad_request
    end
  end
end