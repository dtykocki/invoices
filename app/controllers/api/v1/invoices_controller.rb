module Api
  module V1
    class InvoicesController < ApplicationController
      respond_to :json
      allow_oauth!

      def index
        @invoices = client.invoices
        respond_with @invoices, status: :ok
      end

      def show
        @invoice = client.invoices.where(params[:id]).first
        respond_with @invoice, status: :ok
      end

      def create
        @invoice = client.invoices.build(invoice_params)
        @invoice.save
        respond_with @invoice, status: :created, location: api_v1_client_invoices_url(@invoice)
      end

      def update
        @invoice = client.invoices.where(params[:id]).first
        @invoice.update_attributes(invoice_params)
        respond_with @invoice, status: :ok
      end

      def destroy
        @invoice = client.invoices.where(params[:id]).first
        @invoice.destroy
        respond_with @invoice, status: :ok
      end

      private

      def client
        @client ||= current_user.clients.where(params[:client_id]).first
      end

      def invoice_params
        params.require(:invoice).permit(:due_date, :amount, :status)
      end

    end
  end
end
