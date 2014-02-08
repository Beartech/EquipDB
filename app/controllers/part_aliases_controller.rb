class PartAliasesController < ApplicationController

def new

end

def create

end

private

def part_alias_params
  params.require(:part_alias).permit(:sku, :part_id)
end

end
