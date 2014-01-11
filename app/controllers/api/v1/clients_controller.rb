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
        @client = current_client
        respond_with @client, status: :ok
      end

      def create
        @client = current_user.clients.build(client_params)
        @client.save
        respond_with @client, status: :created
      end

      def update
        @client = current_client
        @client.update_attributes(client_params)
        respond_with @client, status: :ok
      end

      def destroy
        @client = current_client
        @client.destroy
        respond_with @client, status: :ok
      end

      private

      def current_client
        current_user.clients.where(params[:id]).first
      end

      def client_params
        params.require(:client).permit(:name, :email, :company_name)
      end
    end
  end
end
