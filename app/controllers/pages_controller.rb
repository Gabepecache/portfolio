class PagesController < ApplicationController
  def home
  end

  def about
  	@users = User.all
  end

end
