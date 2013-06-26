class ToolsController < ApplicationController
  before_action :set_tool, only: [:show, :edit, :update, :destroy]
  before_action :role_required
  helper_method :sort_column, :sort_direction
  before_action :set_categories

  # GET /tools
  # GET /tools.json
  def index
    #@tools = Tool.order(sort_column + ' ' + sort_direction)
    #@tools = Tool.order(sort_column + ' ' + sort_direction).paginate(:per_page => 10, :page => page_param)
    @tools = Tool.search(search_param).order(sort_column + ' ' + sort_direction)#.paginate(:per_page => 10, :page => page_param)
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
        format.html { redirect_to @tool, notice: 'Tool was successfully created.' }
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
        format.html { redirect_to @tool, notice: 'Tool was successfully updated.' }
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

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tool
      @tool = Tool.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def tool_params
      params.require(:tool).permit(:name, :serial, :station, :apparatus, :purchased, :put_in_service, :cost, :value, :in_service, :retired, :condition, :note, :page, :search)
    end

    def sort_column
      Tool.column_names.include?(params[:sort]) ? params[:sort] : "serial"
    end

    def sort_direction
      %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
    end

    def page_param
      params[:page]
    end

    def search_param
      params[:search]
    end

    def set_categories
      @categories = Dropdown.find_by_name("categories").list
      @stations = Dropdown.find_by_name("stations").list
      @apparatus = Dropdown.find_by_name("apparatus").list
    end
end
