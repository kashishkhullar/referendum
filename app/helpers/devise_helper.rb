module DeviseHelper
  def devise_error_messages!
    return "" unless devise_error_messages?

    messages = resource.errors.full_messages.map { |msg| content_tag(:li, msg) }.join
    sentence = I18n.t("errors.messages.not_saved",
                      :count => resource.errors.count,
                      :resource => resource.class.model_name.human.downcase)

    html = <<-HTML
    <div id="error_explanation">
      <h2>#{sentence} hule ula</h2>
      <ul>#{messages}</ul>
    </div>
    HTML

    html.html_safe
    @messages = {}
    i=0
    resource.errors.full_messages.each do |m|
    @messages[i]=m
    i=i+1

    end
      @messages
    #@messages.as_json
  end

  def devise_error_messages?
    !resource.errors.empty?
  end

end