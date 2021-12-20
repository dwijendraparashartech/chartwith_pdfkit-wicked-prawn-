class YogurtsController < ApplicationController
  before_action :set_yogurt, only: %i[ show edit update destroy ]

  # GET /yogurts or /yogurts.json
  def index
    @yogurts = Yogurt.all
  end

  # GET /yogurts/1 or /yogurts/1.json
  def show
  end

  # GET /yogurts/new
  def new
    @yogurt = Yogurt.new
  end

  # GET /yogurts/1/edit
  def edit
  end

  # POST /yogurts or /yogurts.json
  def create
    @yogurt = Yogurt.new(yogurt_params)

    respond_to do |format|
      if @yogurt.save
        format.html { redirect_to yogurt_url(@yogurt), notice: "Yogurt was successfully created." }
        format.json { render :show, status: :created, location: @yogurt }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @yogurt.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /yogurts/1 or /yogurts/1.json
  def update
    respond_to do |format|
      if @yogurt.update(yogurt_params)
        format.html { redirect_to yogurt_url(@yogurt), notice: "Yogurt was successfully updated." }
        format.json { render :show, status: :ok, location: @yogurt }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @yogurt.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /yogurts/1 or /yogurts/1.json
  def destroy
    @yogurt.destroy

    respond_to do |format|
      format.html { redirect_to yogurts_url, notice: "Yogurt was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_yogurt
      @yogurt = Yogurt.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def yogurt_params
      params.require(:yogurt).permit(:flavor)
    end
end
