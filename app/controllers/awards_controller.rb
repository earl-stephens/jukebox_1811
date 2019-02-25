class AwardsController < ApplicationController

  def index
    @administrator = current_admin?
    @new_award = Award.new
    @awards = Award.all
  end

end
