class RepairsController < ApplicationController
  before_action :role_required
  before_action :set_repair, only: [:show, :edit, :update, :destroy]
  before_action :set_tool, only: [:show, :edit, :update, :destroy]
  # GET /repairs
  # GET /repairs.json
  def index
    @repairs = Repair.all
  end

  # GET /repairs/1
  # GET /repairs/1.json
  def show
  end

  # GET /repairs/new
  def new
    @repair = Repair.new
  end

  # GET /repairs/1/edit
  def edit
  end

  # POST /repairs
  # POST /repairs.json
  def create
    @repair = Repair.new(repair_params)

    respond_to do |format|
      if @repair.save
        format.html { redirect_to tool_path(repair_params[:tool_id]), notice: 'Repair was successfully created.' }
        format.json { render action: 'show', status: :created, location: @repair }
      else
        format.html { render action: 'new' }
        format.json { render json: @repair.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /repairs/1
  # PATCH/PUT /repairs/1.json
  def update
    respond_to do |format|
      if @repair.update(repair_params)
        format.html { redirect_to tool_path(repair_params[:tool_id]), notice: 'Repair was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @repair.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /repairs/1
  # DELETE /repairs/1.json
  def destroy
    @repair.destroy
    respond_to do |format|
      format.html { redirect_to repairs_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_repair
      @repair = Repair.find(params[:id])
    end

    def set_tool
      @tool = Tool.find(params[:tool_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def repair_params
      params.require(:repair).permit(:name, :start_date, :end_date, :tool_id)
    end
end
