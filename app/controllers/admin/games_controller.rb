class Admin::GamesController < ApplicationController

  def index
    @teams = Team.all
  end

  def new
    @team = Team.new
  end

  def create
    @team = Team.new(team_params)

    if @team.save
      redirect_to teams_path, notice: "Yay! Successfully created this team"
    else
      flash[:error] = "There were some errors encountered"
      render :new
    end
  end

  def edit
    @team = Team.find(params[:id])
  end

  def update
    @team = Team.find(params[:id])

    if @team.update_attributes(team_params)
      redirect_to teams_path, notice: "Yay! Successfully edited this team"
    else
      flash[:error] = "There were some errors encountered"
      render :new
    end
  end

  def destroy 
    @team = Team.find(params[:id])
    @team.destroy

    redirect_to teams_path, notice: "Nooo! Successfully deleted this team"

  end

private 
  def team_params
    params.require(:team).permit(:name, :description, :logo, :country)
  end

end
