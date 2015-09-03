class OrganismsController < ApplicationController
  before_action :set_organism, only: [:show, :edit, :update, :destroy]

  def index
    @organisms = Organism.all
  end

  def show
  end

  def new
    @organism = Organism.new
  end

  def edit
  end

  def create
    @organism = Organism.new(organism_params)

    respond_to do |format|
      if @organism.save
        format.html { redirect_to @organism, notice: 'Organism was successfully created.' }
        format.json { render :show, status: :created, location: @organism }
      else
        format.html { render :new }
        format.json { render json: @organism.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @organism.update(organism_params)
        format.html { redirect_to @organism, notice: 'Organism was successfully updated.' }
        format.json { render :show, status: :ok, location: @organism }
      else
        format.html { render :edit }
        format.json { render json: @organism.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @organism.destroy
    respond_to do |format|
      format.html { redirect_to organisms_url, notice: 'Organism was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def import
   Organism.import(params[:file])
   redirect_to organisms_url, notice: 'File imported'
  end

  private
    def set_organism
      @organism = Organism.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def organism_params
      params.require(:organism).permit(:code, :name, :species, :sub_species, :organism_group, :master_group, :viridans_group, :level1, :level2, :level3, :level4)
    end
end
