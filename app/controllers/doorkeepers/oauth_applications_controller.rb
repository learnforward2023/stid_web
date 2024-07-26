# frozen_string_literal: true

module Doorkeepers
  class OauthApplicationsController < Doorkeeper::ApplicationsController
    # NOTE: those actions are used implicitly.
    # def show; super; end
    # def new; super; end
    # def edit; super; end
    # def create; super; end
    # def update; super; end
    # def destroy; super; end
    # def index; super; end

    private

    def application_params
      params.require(:doorkeeper_application).permit(
        :name, :redirect_uri, :scopes, :confidential, :skip_authorization
      )
    end
  end
end
