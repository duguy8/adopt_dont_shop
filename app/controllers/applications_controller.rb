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
    if app_params.values.any?(&:empty?)
      flash[:notice] = "Required fields missing"
      render :new
    else
      flash[:success] = "Application created successfully"
      @application.save
      redirect_to "/applications/#{@application.id}"
    end
  end

  def update
    @application = Application.find(params[:id])
    if params[:description].empty?
      flash[:notice] = "Description required"
      render :show
    else
      @application.update({
        description: params[:description],
        status: "Pending"
        })
      flash[:notice] = "Your application is pending"
      redirect_to "/applications/#{@application.id}"
    end
  end

  private

  def app_params
    params.permit(:name, :street_address, :city, :state, :zipcode)
  end

  def search_params
    params.permit(:search)
  end
end
