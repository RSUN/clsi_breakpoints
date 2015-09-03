class MicsController < ApplicationController
  before_action :set_mic, only: [:show, :edit, :update, :destroy]

  # GET /mics
  # GET /mics.json
  def index
    @mics = Mic.all
  end

  # GET /mics/1
  # GET /mics/1.json
  def show
  end

  # GET /mics/new
  def new
    @mic = Mic.new
  end

  # GET /mics/1/edit
  def edit
  end

  # POST /mics
  # POST /mics.json
  def create
    @mic = Mic.new(mic_params)

    respond_to do |format|
      if @mic.save
        format.html { redirect_to @mic, notice: 'Mic was successfully created.' }
        format.json { render :show, status: :created, location: @mic }
      else
        format.html { render :new }
        format.json { render json: @mic.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /mics/1
  # PATCH/PUT /mics/1.json
  def update
    respond_to do |format|
      if @mic.update(mic_params)
        format.html { redirect_to @mic, notice: 'Mic was successfully updated.' }
        format.json { render :show, status: :ok, location: @mic }
      else
        format.html { render :edit }
        format.json { render json: @mic.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /mics/1
  # DELETE /mics/1.json
  def destroy
    @mic.destroy
    respond_to do |format|
      format.html { redirect_to mics_url, notice: 'Mic was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def import
   Mic.import(params[:file])
   redirect_to mics_url, notice: 'File imported'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_mic
      @mic = Mic.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def mic_params
      params.require(:mic).permit(:isolate_id, :drug_id, :value, :edge)
    end
end
