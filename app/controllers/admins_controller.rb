class AdminsController < ApplicationController
  def show
    @application = Application.find(params[:id])
  end

  def approve

  end
end
