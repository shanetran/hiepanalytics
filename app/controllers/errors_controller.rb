class ErrorsController < ApplicationController
  def file_not_found
    render_error(404, nil)
  end

  # match '/422', to: 'errors#unprocessable', via: :all
  def unprocessable
    render_error(422, nil)
  end

  # match '/500', to: 'errors#internal_server_error', via: :all
  def internal_server_error
    render_error(500, nil)
  end

  private

  def render_error(status, exception)
    if status == 404
      respond_to do |format|
        format.html { render template: "errors/file_not_found", status: status }
        format.json { render json: status }
        format.all { render nothing: true, status: status }
      end
    end
  end
end
