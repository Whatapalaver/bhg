class GameHandsController < ApplicationController
  before_action :get_game
  before_action :set_game_hand, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]

  # GET /game_hands
  # GET /game_hands.json
  def index
    @game_hands = @game.game_hands
  end

  # GET /game_hands/1
  # GET /game_hands/1.json
  def show
  end

  # GET /game_hands/new
  def new
    @game_hand = @game.game_hands.build
  end

  # GET /game_hands/1/edit
  def edit
  end

  # POST /game_hands
  # POST /game_hands.json
  def create
    @game_hand = @game.game_hands.build(game_hand_params)

    respond_to do |format|
      if @game_hand.save
          format.html { redirect_to game_game_hands_path(@game), notice: 'game_hand was successfully created.' }
          format.json { render :show, status: :created, location: @game_hand }
      else
          format.html { render :new }
          format.json { render json: @game_hand.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /game_hands/1
  # PATCH/PUT /game_hands/1.json
  def update
    respond_to do |format|
      if @game_hand.update(game_hand_params)
        format.html { redirect_to game_game_hand_path(@game), notice: 'game_hand was successfully updated.' }
        format.json { render :show, status: :ok, location: @game_hand }
      else
        format.html { render :edit }
        format.json { render json: @game_hand.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @game_hand.destroy
     respond_to do |format|
      format.html { redirect_to game_game_hands_path(@game), notice: 'game_hand was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  # DELETE /game_hands/1
  # DELETE /game_hands/1.json
  private
    # Use callbacks to share common setup or constraints between actions.

    def get_game
      @game = Game.find(params[:game_id])
    end

    def set_game_hand
      @game_hand = @game.game_hands.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def game_hand_params
      params.require(:game_hand).permit(:direction, :cards, :game_id)
    end
end