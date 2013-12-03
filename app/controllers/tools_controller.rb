class ToolsController < ApplicationController
  before_action :set_tool, only: [:show, :edit, :update, :destroy, :toggle_in_service, ]
  before_action :role_required
  helper_method :sort_column, :sort_direction
  before_action :set_categories, :set_tab
  before_action :set_form_drop_down, only: [:new, :edit, :update]


  # GET /tools
  # GET /tools.json
  def index
    @tools = Tool.all

  end

  # GET /tools/1
  # GET /tools/1.json
  def show
  end

  # GET /tools/new
  def new
    @tool = Tool.new

  end

  # GET /tools/1/edit
  def edit
  end

  # POST /tools
  # POST /tools.json
  def create
    @tool = Tool.new(tool_params)

    respond_to do |format|
      if @tool.save
        format.html { redirect_to @tool; gflash :success => 'Tool was successfully created.' }
        format.json { render action: 'show', status: :created, location: @tool }
      else
        format.html { render action: 'new' }
        format.json { render json: @tool.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tools/1
  # PATCH/PUT /tools/1.json
  def update
    respond_to do |format|
      if @tool.update(tool_params)
        format.html { redirect_to @tool; gflash :success => 'Tool was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @tool.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tools/1
  # DELETE /tools/1.json
  def destroy
    @tool.destroy
    respond_to do |format|
      format.html { redirect_to tools_url }
      format.json { head :no_content }
    end
  end

  def toggle_in_service
     status_change = @tool.in_service ? false : true
     @tool.update(:in_service => status_change)
     respond_to do |format|
       format.html { redirect_to(@tool) }
       format.js
     end
  end



  private




  # Use callbacks to share common setup or constraints between actions.
    def set_tool
      @tool = Tool.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def tool_params
      params.require(:tool).permit(:name, :serial, :model, :location, :location_id, :category_id, :purchased, :cost, :value, :in_service, :loaner, :retired, :condition, :note, :tab)
    end

    def set_form_drop_down
      @form_categories = {}
      Category.all.each {|cat| @form_categories[cat.name] = cat.id}
      @form_locations = {}
      Location.all.each {|loc| @form_locations[loc.name] = loc.id}
    end

    def set_tab
      params[:tab] ? params[:tab] : '#0'
    end
end
