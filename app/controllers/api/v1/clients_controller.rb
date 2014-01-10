module Api
  module V1
    class ClientsController < ApplicationController
      before_filter :authenticate_user!
      respond_to :json
      allow_oauth!

      def index
        @clients = current_user.clients
        respond_with @clients, status: :ok
      end

      def show
        @client = current_user.clients.where(params[:id]).first
        respond_with @client, status: :ok
      end
    end
  end
end
