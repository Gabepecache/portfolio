class PagesController < ApplicationController
  def home
  end

  def about
  end

  def admin
  	redirect_to :root if (current_user.try(:user) || current_user == nil)
  	@users = User.all.order('email ASC')
  	@up = params[:upgrade]
  	@down = params[:downgrade]
  	@evo = params[:evolve]

  end

end
