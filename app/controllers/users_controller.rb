class UsersController < ApplicationController
before_action :set_user

  def destroy
    @user.destroy
      respond_to do |format|
      format.html { redirect_to pins_url, notice: 'Pin was successfully destroyed.'  }
      format.json { head :no_content }
    end
  end

	private
    def set_user
      @user = User.find(params[:id])
    end
end


