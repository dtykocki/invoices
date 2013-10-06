class ClientsController < ApplicationController
  before_filter :authenticate_user!

  def index
    @clients = current_user.clients
  end

  def edit
    @client = current_user.clients.find(params[:id])
  end

  def update
    @client = current_user.clients.find(params[:id])
    if @client.update_attributes(client_params)
      redirect_to clients_path, notice: 'Client updated successfully'
    else
      render :edit
    end
  end

  def create
    @client = current_user.clients.build(client_params)
    if @client.save
      redirect_to clients_path
    else
      render :new
    end
  end

  def new
    @client = current_user.clients.build
  end
  
  def destroy
    @client = Client.find(params[:id])
    @client.destroy
    redirect_to clients_path
  end

  private

  def client_params
    params.require(:client).permit(:company_name, :name, :email)
  end
end
