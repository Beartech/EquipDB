class PartAliasesController < ApplicationController

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

private

def part_alias_params
  params.require(:part_alias).permit(:sku, :part_id)
end

end
