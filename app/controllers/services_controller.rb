class ServicesController < ApplicationController
  def index
    @services = Service.all
    @services_group_by_type = @services.group_by(&:service_type)
  end

  def show
    @service = Service.find(params[:id])
  end
end
