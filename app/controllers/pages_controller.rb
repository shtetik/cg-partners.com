class PagesController < ApplicationController
  def home
    @people = Person.includes(:translations).order(:id)
    @services = Service
      .includes({ service_type: :translations }, :translations)
      .order(:id)
    @services_group_by_type = @services.group_by(&:service_type)
  end

  def startup;end

  def contact;end
end
