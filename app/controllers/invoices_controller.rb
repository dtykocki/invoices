class InvoicesController < ApplicationController
  before_filter :authenticate_user!

  def index
    @invoices = current_user.invoices 
  end

  def new
    @clients = current_user.clients
    @invoice = Invoice.new
  end

  def create
    @invoice = current_user.invoices.build(invoice_params)
    if @invoice.save
      redirect_to invoices_path, notice: "Invoice created"
    else
      render :new
    end
  end

  private

  def invoice_params
    params.require(:invoice).permit(:due_date, :amount, :status, :client_id)
  end

end
