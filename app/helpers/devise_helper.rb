module DeviseHelper
  def devise_error_messages!
    return "" unless devise_error_messages?

    for_header = pluralize(resource.errors.count, "error")
    messages = resource.errors.full_messages.map { |msg| content_tag(:li, msg, class: 'list-group-item' ) }.join

	html = <<-HTML
	<div class="container" style="padding-bottom: 1rem;">
	  <div class="row justify-content-md-center">
	    <div class="col-md-6">
	      <div class="card border-danger">
	        <div class="card-header">#{for_header}</div>
	        <ul class="list-group list-group-flush">#{messages}</ul>
	      </div>
	    </div>
	  </div>
	</div>
	HTML

	html.html_safe
 
  end

  def devise_error_messages?
    !resource.errors.empty?
  end

end