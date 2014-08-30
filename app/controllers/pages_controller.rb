class PagesController < ApplicationController
  def home
  end

  def about
  end

  def admin
  	@users = User.all.order('email ASC')
  	@up = params[:upgrade]
  	@down = params[:downgrade]
  end

end
