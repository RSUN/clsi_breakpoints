class IsolatesController < ApplicationController
  before_action :set_isolate, only: [:show, :edit, :update, :destroy]

  def index
    @isolates = Isolate.all
  end

  def show
  end

  def new
    @isolate = Isolate.new
  end

  def edit
  end

  def create
    @isolate = Isolate.new(isolate_params)

    respond_to do |format|
      if @isolate.save
        format.html { redirect_to @isolate, notice: 'Isolate was successfully created.' }
        format.json { render :show, status: :created, location: @isolate }
      else
        format.html { render :new }
        format.json { render json: @isolate.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @isolate.update(isolate_params)
        format.html { redirect_to @isolate, notice: 'Isolate was successfully updated.' }
        format.json { render :show, status: :ok, location: @isolate }
      else
        format.html { render :edit }
        format.json { render json: @isolate.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @isolate.destroy
    respond_to do |format|
      format.html { redirect_to isolates_url, notice: 'Isolate was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
 def import
   Isolate.import(params[:file])
   redirect_to isolates_url, notice: 'File imported'
  end
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_isolate
      @isolate = Isolate.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def isolate_params
      params.require(:isolate).permit(:isolate_id, :collection, :site, :study_year, :bank, :organism_code)
    end
end
