class CharacterInventoriesController < ApplicationController
  before_action :set_character_inventory, only: %i[ show edit update destroy ]

  # GET /character_inventories or /character_inventories.json
  def index
    @character_inventories = CharacterInventory.all
  end

  # GET /character_inventories/1 or /character_inventories/1.json
  def show
  end

  # GET /character_inventories/new
  def new
    @character_inventory = CharacterInventory.new
  end

  # GET /character_inventories/1/edit
  def edit
  end

  # POST /character_inventories or /character_inventories.json
  def create
    @character_inventory = CharacterInventory.new(character_inventory_params)

    respond_to do |format|
      if @character_inventory.save
        format.html { redirect_to character_inventory_url(@character_inventory), notice: "Character inventory was successfully created." }
        format.json { render :show, status: :created, location: @character_inventory }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @character_inventory.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /character_inventories/1 or /character_inventories/1.json
  def update
    respond_to do |format|
      if @character_inventory.update(character_inventory_params)
        format.html { redirect_to character_inventory_url(@character_inventory), notice: "Character inventory was successfully updated." }
        format.json { render :show, status: :ok, location: @character_inventory }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @character_inventory.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /character_inventories/1 or /character_inventories/1.json
  def destroy
    @character_inventory.destroy!

    respond_to do |format|
      format.html { redirect_to character_inventories_url, notice: "Character inventory was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_character_inventory
      @character_inventory = CharacterInventory.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def character_inventory_params
      params.require(:character_inventory).permit(:character_id, :money)
    end
end
