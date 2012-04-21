class MatchmakerController < ApplicationController
  def index
  	@User = current_user
  	@Users = User.all.near(:coordinates => current_user.to_coordinates)


  	
  	  



  end

  def show
  end


  

end
