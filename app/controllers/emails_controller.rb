class EmailsController < ApplicationController
  def index
    @emails = Email.all
  end

  def create
    @email = Email.new(object:Faker::Company.buzzword, body:Faker::Company.bs)
    if @email.save
      respond_to do |format|
      format.html {redirect_to root_path}
      format.js { } 
      end
    else
      redirect_to root_path
      flash[:notice] = "Please try again"
    end
  end

  def show
    @email = Email.find(params[:id])
  end

  def destroy
    @email = Email.find(params[:id])
    @email.destroy
      respond_to do |format| 
        format.html{redirect_to root_path}
        format.js{ }
      end
  end
end
