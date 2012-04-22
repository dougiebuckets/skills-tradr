class ProfileController < ApplicationController
  def me
  	@User = current_user
  end
end
