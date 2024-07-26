# frozen_string_literal: true

class AddSkipAuthorizationToOauthApplications < ActiveRecord::Migration[7.1]
  def change
    add_column :oauth_applications, :skip_authorization, :boolean, default: false
  end
end
