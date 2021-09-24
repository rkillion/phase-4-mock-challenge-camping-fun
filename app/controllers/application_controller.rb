class ApplicationController < ActionController::API
  include ActionController::Cookies
  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found
  rescue_from ActiveRecord::RecordInvalid, with: :render_invalid_message

  private
  def record_not_found(instance)
    render json: {errors: instance.message}, status: 404
  end

  def render_invalid_message(instance)
    render json: {errors: [instance.message]}, status: 422
  end
end
