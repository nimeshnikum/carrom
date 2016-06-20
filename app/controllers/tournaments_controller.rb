class TournamentsController < ApplicationController
  before_action :find_tournament, only: [:show, :edit, :update, :destroy]

  def index
    @tournaments = Tournament.all
  end

  # GET /players/1
  # GET /players/1.json
  def show
  end

  # GET /players/new
  def new
    @tournament = Tournament.new
  end

  # GET /players/1/edit
  def edit
  end

  # POST /players
  # POST /players.json
  def create
    @tournament = Tournament.new(tournament_params)

    respond_to do |format|
      if @tournament.save
        format.html { redirect_to tournaments_path, notice: 'Tournament was successfully created.' }
        format.json { render action: 'index', status: :created, location: @tournament }
      else
        format.html { render action: 'new' }
        format.json { render json: @tournament.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /players/1
  # PATCH/PUT /players/1.json
  def update
    respond_to do |format|
      if @tournament.update(tournament_params)
        format.html { redirect_to tournaments_path, notice: 'Tournament was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @tournament.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /players/1
  # DELETE /players/1.json
  def destroy
    @tournament.destroy
    respond_to do |format|
      format.html { redirect_to tournaments_url }
      format.json { head :no_content }
    end
  end

  def set_current
    find_tournament(params[:tournament][:id])
    session[:current_tournament] = @tournament.try(:id)
    p "11111111111111111"
    p session[:current_tournament]
    redirect_to :back
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def find_tournament(id=nil)
      @tournament = Tournament.find(id || params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def tournament_params
      params.require(:tournament).permit(:name, :score, :team_id, :image)
    end
end
