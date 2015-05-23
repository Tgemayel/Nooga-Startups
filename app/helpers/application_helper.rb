module ApplicationHelper

  # Evaluates to true if the request is for the "homepage"
  def homepage?
    request.original_fullpath == "/"
  end

end
