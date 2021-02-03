class GamesController < ApplicationController
  before_action :set_game, only: [:show, :edit, :update, :destroy]
  rescue_from ActiveRecord::RecordNotFound, :with => :show_errors

  # GET /games
  # GET /games.json
  def index
    @games = Game.all
  end

  # GET /games/1
  # GET /games/1.json
  def show
    @north = @game.game_hands.find_by(direction: 'N').decorate
    @east = @game.game_hands.find_by(direction: 'E').decorate
    @south = @game.game_hands.find_by(direction: 'S').decorate
    @west = @game.game_hands.find_by(direction: 'W').decorate
  end

  # GET /games/new
  def new
    deck = Deck.new.shuffle!

    @game = Game.new()
    @game.game_hands.build(direction: :N, cards: deck.deal(13).sort().map {|card| card.to_s}.join(" "))
    @game.game_hands.build(direction: :S, cards: deck.deal(13).sort().map {|card| card.to_s}.join(" "))
    @game.game_hands.build(direction: :E, cards: deck.deal(13).sort().map {|card| card.to_s}.join(" "))
    @game.game_hands.build(direction: :W, cards: deck.deal(13).sort().map {|card| card.to_s}.join(" "))
  end

  # GET /games/1/edit
  def edit
  end

  # POST /games
  # POST /games.json
  def create
    @game = Game.new(game_params)

    respond_to do |format|
      if @game.save
        format.html { redirect_to @game, notice: 'Game was successfully created.' }
        format.json { render :show, status: :created, location: @game }
      else
        format.html { render :new }
        format.json { render json: @game.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /games/1
  # PATCH/PUT /games/1.json
  def update
    respond_to do |format|
      if @game.update(game_params)
        format.html { redirect_to @game, notice: 'Game was successfully updated.' }
        format.json { render :show, status: :ok, location: @game }
      else
        format.html { render :edit }
        format.json { render json: @game.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /games/1
  # DELETE /games/1.json
  def destroy
    @game.destroy
    respond_to do |format|
      format.html { redirect_to games_url, notice: 'Game was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def search
    if search_params['search'].blank?  
      redirect_to games_path, notice: 'Search was blank.'
    else  
      @game = Game.find_by_seed(search_params[:search].to_i)
      redirect_to @game
    end
  end

  private

    def show_errors(exception)
      redirect_to games_path, notice: 'Game ID was not recognised'
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_game
      @game = Game.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def game_params
      params.require(:game).permit(:seed, :name, :category, game_hands_attributes: [:direction, :cards, :_destroy])
    end

    def search_params
      params.permit(:search, :commit)
    end
  
end
