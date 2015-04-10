class GuestsController < ApplicationController
  def new
    @guest = Guest.new
  end
  
  def create
    @guest = Guest.new params[:guest]
    if @guest.save
      send_welcome_message @guest
      redirect_to @guest
    else
      render :action => :new
    end
  end
  
  def show
    @guest = Guest.find_by_token(params[:id])
    redirect_to root_path if @guest.nil?
  end
  
  def edit
    @guest = Guest.find_by_token(params[:id])
    redirect_to root_path if @guest.nil?
  end
  
  def update
    @guest = Guest.find_by_token(params[:id])
    if @guest.update_attributes(params[:guest])
      send_welcome_message @guest if @guest.email.present?
      redirect_to @guest
    else
      render :action => :edit
    end
  end
  
  private
  def send_welcome_message(guest)
    GuestMailer.welcome_email(guest).deliver
  end
  
end
