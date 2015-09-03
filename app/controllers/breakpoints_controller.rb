class BreakpointsController < ApplicationController
  before_action :set_breakpoint, only: [:show, :edit, :update, :destroy]

  def index
    @breakpoints = Breakpoint.all
  end

  def show
  end

  def new
    @breakpoint = Breakpoint.new
  end

  def edit
  end

  def create
    @breakpoint = Breakpoint.new(breakpoint_params)

    respond_to do |format|
      if @breakpoint.save
        format.html { redirect_to @breakpoint, notice: 'Breakpoint was successfully created.' }
        format.json { render :show, status: :created, location: @breakpoint }
      else
        format.html { render :new }
        format.json { render json: @breakpoint.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @breakpoint.update(breakpoint_params)
        format.html { redirect_to @breakpoint, notice: 'Breakpoint was successfully updated.' }
        format.json { render :show, status: :ok, location: @breakpoint }
      else
        format.html { render :edit }
        format.json { render json: @breakpoint.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @breakpoint.destroy
    respond_to do |format|
      format.html { redirect_to breakpoints_url, notice: 'Breakpoint was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def import
   Breakpoint.import(params[:file])
   redirect_to breakpoints_url, notice: 'File imported'
  end
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_breakpoint
      @breakpoint = Breakpoint.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def breakpoint_params
      params.require(:breakpoint).permit(:drug_id, :s_maximum, :r_minimum, :surrogate_drugs, :r_if_surrogate_is, :ni_if_surrogate_is, :r_if_blt_is, :delivery_mechanism, :infection_type, :footnote, :master_group_include, :organism_group_include, :viridans_group_include, :genus_include, :genus_exclude, :organism_code_include, :organism_code_exclude, :gram_include, :level_1_include, :level_3_include, :level_3_exclude)
    end
end
