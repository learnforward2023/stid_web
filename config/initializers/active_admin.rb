# frozen_string_literal: true

ActiveAdmin.setup do |config|
  config.site_title = 'Identity'
  config.authentication_method = :authenticate_user!
  config.authorization_adapter = ActiveAdmin::CanCanAdapter
  config.on_unauthorized_access = :access_denied
  config.current_user_method = :current_user
  config.logout_link_path = :destroy_user_session_path
  config.batch_actions = true
  config.filter_attributes = %i[encrypted_password password password_confirmation]
  config.localize_format = :long
end
