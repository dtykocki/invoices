module Api
  module V1
    class ClientsController < ApplicationController
      respond_to :json

      def index
        clients = Client.all
        respond_with clients, status: :ok
      end
    end
  end
end
