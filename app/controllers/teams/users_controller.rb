class Teams::UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_team_user

  # DELETE /team_users/1 or /team_users/1.json
  def destroy
    @team_user.destroy
    redirect_to team_users_url, notice: "Team member has been removed."
  end

  private

    # Use callbacks to share common setup or constraints between actions.
    def set_team_user
      @team_user = current_user.team.team_users.find_by(user_id: params[:id])
    end
end
