class DevLogsController < ApplicationController
  before_action :set_dev_log, only: [:show, :edit, :update, :destroy]

  # GET /dev_logs
  # GET /dev_logs.json
  def index
    @dev_logs = DevLog.all.order(:created_at)
  end

  # GET /dev_logs/1
  # GET /dev_logs/1.json
  def show
  end

  # GET /dev_logs/new
  def new
    @dev_log = DevLog.new
  end

  # GET /dev_logs/1/edit
  def edit
  end

  # POST /dev_logs
  # POST /dev_logs.json
  def create
    @dev_log = DevLog.new(dev_log_params)
    @dev_log.user_id = current_user.id

    respond_to do |format|
      if @dev_log.save
        format.html { redirect_to @dev_log, notice: 'Dev log was successfully created.' }
        format.json { render action: 'show', status: :created, location: @dev_log }
      else
        format.html { render action: 'new' }
        format.json { render json: @dev_log.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /dev_logs/1
  # PATCH/PUT /dev_logs/1.json
  def update
    respond_to do |format|
      if @dev_log.update(dev_log_params)
        format.html { redirect_to @dev_log, notice: 'Dev log was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @dev_log.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /dev_logs/1
  # DELETE /dev_logs/1.json
  def destroy
    @dev_log.destroy
    respond_to do |format|
      format.html { redirect_to dev_logs_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_dev_log
      @dev_log = DevLog.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def dev_log_params
      params.require(:dev_log).permit(:note, :user_id)
    end
end
