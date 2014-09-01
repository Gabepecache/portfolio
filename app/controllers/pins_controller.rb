class PinsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_pin, only: [:show, :edit, :update, :destroy]
  before_action :correct_user, only: [:edit, :update, :destroy]

  def index
    @pins = Pin.all.order("created_at DESC").paginate(:page => params[:page], :per_page => 15)
  end

  def show
    render :layout => false
  end

  def new
    @pin = current_user.pins.build
    render :layout => false
  end

  def edit
  end

  def create
    @pin = current_user.pins.build(pin_params)
      if @pin.save
        redirect_to @pin, notice: 'Pin was successfully created.' 
      else
        render :new 
      end
  end

  def update 
    respond_to do |format|
       if @pin.update(pin_params)
        format.html { redirect_to @pin, notice: 'Pin was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @pin.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @pin.destroy
      respond_to do |format|
      format.html { redirect_to pins_url, notice: 'Pin was successfully destroyed.'  }
      format.json { head :no_content }
    end
  end

  private
    def set_pin
      @pin = Pin.find(params[:id])
    end

    def correct_user
      @pin = current_user.pins.find_by(id: params[:id])
      redirect_to pins_path, notice: 'Not Authorized' if @pin.nil?
    end

    def pin_params
      params.require(:pin).permit(:description, :image)
    end
end
