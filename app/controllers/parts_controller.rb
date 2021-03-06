class PartsController < ApplicationController
  before_action :role_required
  before_action :set_part, only: [:show, :edit, :update, :destroy]

  # GET /parts
  # GET /parts.json
  def index
    #@parts = Part.all
    @parts = TableOfPart.all
  end

  # GET /parts/1
  # GET /parts/1.json
  def show
  end

  # GET /parts/new
  def new
    @part = Part.new(inventory: 0, maximum: 0, minimum: 0)
    @part.part_aliases.build
  end

  # GET /parts/1/edit
  def edit
  end

  # POST /parts
  # POST /parts.json
  def create
    @part = Part.new(part_params)

    respond_to do |format|
      if @part.save
        format.html { redirect_to @part; gflash :success => 'Part was successfully created.' }
        format.json { render action: 'show', status: :created, location: @part }
      else
        format.html { render action: 'new' }
        format.json { render json: @part.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /parts/1
  # PATCH/PUT /parts/1.json
  def update
    respond_to do |format|
      if @part.update(part_params)
        format.html { redirect_to @part; gflash :success => 'Part was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @part.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /parts/1
  # DELETE /parts/1.json
  def destroy
    @part.destroy
    respond_to do |format|
      format.html { redirect_to parts_url }
      format.json { head :no_content }
    end
  end

  def inventory_levels
    @parts = Part.all.order(:name)
    render 'inventory_levels', layout: "print_table"
  end

  def part_lookup
        #this returns an array to be compatible with the rendering JS
     if @part = Part.find_by(sku: part_params[:sku])
       @parts_list = [@part]
     elsif @part_alias = PartAlias.find_by(sku: part_params[:sku])
       @parts_list = [@part_alias.part]
     else
       @part_list = nil
     end


  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_part
      @part = Part.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def part_params
      params.require(:part).permit(:name, :sku, :category, :inventory, :id, :minimum, :maximum, :consumable, :part_aliases_attributes => [:sku])
    end
end
