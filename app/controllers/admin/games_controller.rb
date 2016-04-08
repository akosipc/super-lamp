class Admin::GamesController < AdminController

  def index
    @games = Game.all
  end

  def new
    @game = Game.new
  end

  def create
    @game = Game.new(game_params)

    if @game.save
      redirect_to admin_games_path, notice: "Yay! Successfully created this game"
    else
      flash[:error] = "There were some errors encountered"
      render :new
    end
  end

  def edit
    @game = Game.find(params[:id])
  end

  def update
    @game = Game.find(params[:id])

    if @game.update_attributes(game_params)
      redirect_to admin_games_path, notice: "Yay! Successfully edited this game"
    else
      flash[:error] = "There were some errors encountered"
      render :new
    end
  end

  def destroy 
    @game = Game.find(params[:id])
    @game.destroy

    redirect_to admin_games_path, notice: "Nooo! Successfully deleted this game"
  end

private 
  def game_params
    params.require(:game).permit(:name, :kind)
  end

end
