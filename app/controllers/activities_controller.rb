class ActivitiesController < ApplicationController
  #if record doesn't exist
rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response
#if record cannot be processed/created
rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity_response

  #GET /actvities
  def index 
    render json: Activity.all
  end

  # DELETE /activities/:id
  def destroy 
    activity = Activity.find(params[:id])

    activity.destroy
    head :no_content
  end

  private

  def render_not_found_response
    render json: {error: "Activity not found"}, status: :not_found
  end

  def render_unprocessable_entity_response(exception)
    render json: {errors: exception.record.errors.full_messages}, status: :unprocessable_entity
  end

end
