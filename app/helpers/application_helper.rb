module ApplicationHelper
  def render_success(partial, locals = {}, options ={})
    html = render_to_string(:partial => partial, :layout => false, :locals => locals)
    render :json => options.merge!({ :error => false, :html => html })
  end
  
  def hypen(data)
    if data.zero?
      "-"
    else
      data
    end
  end
end
