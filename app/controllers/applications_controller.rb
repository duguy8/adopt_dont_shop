class ApplicationsController < ApplicationController
  def show
    if params[:search]
      @pets = Pet.search(search_params)
      @application = Application.find(params[:id])
    else
      @application = Application.find(params[:id])
    end
  end

  def new
  end

  def create
    @application = Application.create(app_params)
    @application.update(status: "In Progress")

    if app_params.values.any?(&:empty?)
      flash[:notice] = "Required fields missing"
      render :new
    else
      @application.save
      redirect_to "/applications/#{@application.id}"
    end
  end

  def update
    @application = Application.find(params[:id])
    @application.update({
      description: params[:description],
      status: "Pending"
      })
    redirect_to "/applications/#{@application.id}"
  end

  private

  def app_params
    params.permit(:name, :street_address, :city, :state, :zipcode)
  end

  def search_params
    params.permit(:search)
  end
end
