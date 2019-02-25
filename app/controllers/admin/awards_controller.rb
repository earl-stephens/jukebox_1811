class Admin::AwardsController < ApplicationController

  def create
    @admin = User.find(params[:user_id])
    @award = @admin.awards.new(params[:id])
    redirect_to user_path(@award)
  end

end
