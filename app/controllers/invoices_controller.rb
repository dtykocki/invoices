class InvoicesController < ApplicationController
  before_filter :authenticate_user!

  def index
    @invoices = current_user.invoices 
  end
end
