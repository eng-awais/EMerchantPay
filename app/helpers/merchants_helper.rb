# frozen_string_literal: true

module MerchantsHelper
  def display_error_flash(flash_error)
    return nil unless flash_error

    "<div class='toast align-items-center' role='alert' aria-live='assertive' aria-atomic='true'>
      <div class='d-flex'>
        <div class='toast-body'>
          #{flash_error}
        </div>
        <button class='btn-close me-2 m-auto' type='button' data-bs-dismiss='toast' aria-label='Close'/>
      </div>
    </div>".html_safe
  end
end
