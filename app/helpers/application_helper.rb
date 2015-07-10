module ApplicationHelper
  def active_section (sec)
    controller_name == sec ? 'active' : ''
  end
end
