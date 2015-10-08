module HeaderConcern
  extend ControllerSupport::Base

  helper_method :header_title, :header_action, :action_url, :action_icon, :header_action?

  def header_title(value = nil)
    (@_header_title ||= value).presence || t('layouts.header.title')
  end

  def action_url(url = nil)
    @_url ||= url
  end

  def action_icon(icon = nil)
    @_icon ||= icon
  end

  def header_action(opts = {})
    action_url(opts[:url])
    action_icon(opts[:icon])
  end

  def header_action?
    action_icon.present? && action_url.present?
  end

end