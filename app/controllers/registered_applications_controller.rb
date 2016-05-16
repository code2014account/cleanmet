class RegisteredApplicationsController < ApplicationController




  def index
    @registered_applications = RegisteredApplication.all
  end

  def show
    @registered_application = RegisteredApplication.find(params[:id])
  end

  def new
    @registered_application = RegisteredApplication.new(params[:topic_id])
  end

  def edit
    @registered_application = RegisteredApplication.find(params[:id])
  end

  def create
    p "@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"
    p registered_application_params
    @registered_application = RegisteredApplication.new(registered_application_params)


    if @registered_application.save
      redirect_to @registered_application, notice: "Application was saved!"
    else
      flash[:error] = "There was an error saving the app. Try again."
      render "users/show"
    end
  end

  def update
  end

  def destroy

    @registered_application = RegisteredApplication.find(params[:id])

    if @registered_application.destroy
      flash[:notice] = "\"#{@registered_application.name}\" was deleted succesfully."
    else
      flash[:error] = "There was an error deleting the Application."
    end
    redirect_to current_user
  end


  private

  def registered_application_params
    params.require(:registered_application).permit(:name, :url)
  end


end
