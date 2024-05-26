module ApplicationHelper

  def bootstrap_flash_class(flash_type)
    case flash_type
    when 'notice'
      'success'
    when 'alert', 'error'
      'danger'
    when 'warning'
      'warning'
    else
      'info'
    end
  end
end
