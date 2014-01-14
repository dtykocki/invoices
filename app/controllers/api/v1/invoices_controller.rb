module Api
  module V1
    class InvoicesController < ApplicationController
      respond_to :json
      allow_oauth!

      def index
        client = current_user.clients.where(params[:client_id]).first
        @invoices = client.invoices
        respond_with @invoices, status: :ok
      end
    end
  end
end
