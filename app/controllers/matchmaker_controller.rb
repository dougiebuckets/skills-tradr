class MatchmakerController < ApplicationController
  def index
  	@User = current_user
  	#@Users = User.all.near(:coordinates => current_user.to_coordinates)
  	@Users = current_user.nearbys()
  	#@Users = User.all.where(:coordinates.near => [[-73.98, 40.77],2])


  	
  	  



  end

  def show
  end


  

end
