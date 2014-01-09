module Api
  module V1
    class ClientsController < ApplicationController
      before_filter :authenticate_user!
      respond_to :json
      allow_oauth! only: [:index]

      def index
        @clients = current_user.clients
        respond_with @clients, status: :ok
      end
    end
  end
end
