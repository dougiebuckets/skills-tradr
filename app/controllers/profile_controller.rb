class ProfileController < ApplicationController
  def me
  	@User = current_user
  	@street, @city, @state, @counter = current_user.address.split(',')
  	@map = "<img src='http://maps.google.com/maps/api/staticmap?size=255x255&maptype=roadmap&sensor=false&markers=color:blue|label:A|"+@city + "," + @state+ "&markers=blue' ></img>"
  end
end
