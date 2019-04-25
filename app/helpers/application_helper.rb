module ApplicationHelper
  def toastr_flash_notifications
    flash_messages = []
    flash.each do |type, message|
      type = 'success' if type == 'notice'
      type = 'info' if type == 'primary'
      type = 'error'   if ['alert', 'danger'].include?(type)
      if message.kind_of?(Array)
        message.uniq.each do |m|
          text = "toastr.#{type}('#{m}');"
          flash_messages << text.html_safe if m
        end
      else
        text = "toastr.#{type}('#{message}');"
        flash_messages << text.html_safe if message
      end
    end
    flash_messages.join("\n").html_safe
  end
end
