module Api
  module V1
    class InvoicesController < ApplicationController
      respond_to :json
      allow_oauth!

      def index
        @client   = current_user.clients.where(params[:client_id]).first
        @invoices = @client.invoices
        respond_with @invoices, status: :ok
      end

      def show
        @client   = current_user.clients.where(params[:client_id]).first
        @invoice  = @client.invoices.where(params[:id]).first
        respond_with @invoice, status: :ok
      end

      def create
        @client   = current_user.clients.where(params[:client_id]).first
        @invoice  = @client.invoices.build(invoice_params)
        if @invoice.valid?
          @invoice.save
          respond_with @invoice, status: :created, location: api_v1_client_invoices_url(@invoice)
        else

        end
      end

      def update
        @client   = current_user.clients.where(params[:client_id]).first
        @invoice  = @client.invoices.where(params[:id]).first
        @invoice.update_attributes(invoice_params)
        respond_with @invoice, status: :ok
      end

      private

      def invoice_params
        params.require(:invoice).permit(:due_date, :amount, :status)
      end

    end
  end
end
