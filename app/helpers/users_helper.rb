# frozen_string_literal: true

module UsersHelper
  def display_flash(flash_error)
    return unless flash_error

    "<div class='alert alert-danger col-sm-4' role='alert'>
      #{flash_error}
    </div>".html_safe
  end

end
