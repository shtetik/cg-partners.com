class PeopleController < ApplicationController
  def index
    @people = Person.includes(:translations).order(:id)
  end

  def show
    @person = Person.find(params[:id])
  end
end
