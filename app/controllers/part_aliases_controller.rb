class PartAliasesController < ApplicationController
  before_action :role_required

def new
   @part_alias = PartAlias.new(part_id: part_alias_params[:part_id])
end

def create
      @part_alias = PartAlias.new(part_alias_params)
  respond_to do |format|
    if @part_alias.save
      format.html { redirect_to @part_alias.part; gflash :success => 'Part alias was successfully created.' }
    else
      format.html { render action: 'new' }
    end
  end
end

def destroy
  set_part_alias
  part_id = @part_alias.part_id
  @part_alias.destroy
  respond_to do |format|
    format.html { redirect_to edit_part_path(part_id) }
  end
end

private

def set_part_alias
  @part_alias = PartAlias.find(params[:id])
end

def part_alias_params
  params.require(:part_alias).permit(:sku, :part_id, :id)
end

end
