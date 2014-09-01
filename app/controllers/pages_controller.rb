class PagesController < ApplicationController
  def home
  end

  def about
  end

  def admin
  	redirect_to :root if (!current_user.try(:admin?) || !current_user.try(:king?) || current_user.try(:email)  != "gabepecache@gmail.com")
  	@users = User.all.order('email ASC')
  	@up = params[:upgrade]
  	@down = params[:downgrade]
  	@evo = params[:evolve]

  end

end
