class ServicesController < ApplicationController
  before_action :set_services_group_by_type

  def index;end

  def show
    @service = Service.find(params[:id])
  end

  private

  def set_services_group_by_type
    @services = Service
      .includes({ service_type: :translations }, :translations)
      .order(:id)
    @services_group_by_type = @services.group_by(&:service_type)
  end
end
