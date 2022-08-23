# frozen_string_literal: true

module MerchantsHelper
  def display_flash(flash_error)
    return unless flash_error

    "<div class='alert alert-danger col-sm-4' role='alert'>
      #{flash_error}
    </div>".html_safe
  end

  def display_button?
    'hidden' unless current_user.admin_user?
  end
end
