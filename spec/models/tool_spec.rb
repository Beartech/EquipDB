require 'spec_helper'

describe Tool do
  context 'basic factory' do
    it 'has a valid factory' do
      expect(build(:tool)).to be_valid
    end
  end

  context  'validations' do

    it 'is valid with a name, serial, model, location, category' do

      expect(build(:tool, location: Location.new(name: 'Sta 72'),
                   category: Category.new(name: 'Chainsaw'))).to be_valid

    end
    it 'is invalid without a name' do
      expect(build(:tool, name: nil)).to have(1).errors_on(:name)
    end
    it 'is invalid without a serial' do
      expect(build(:tool, serial: nil)).to have(1).errors_on(:serial)
    end
    it 'is invalid without a model' do
      expect(build(:tool, model: nil)).to have(1).errors_on(:model)
    end
    it 'is invalid with a duplicate serial' do
      chainsaw = build(:category, name: 'Chainsaw')
       tool1 = create(:tool, serial: '12345', category: chainsaw)
       tool2 = build(:tool, serial: '12345', category: chainsaw)

      expect(tool2).to have(1).errors_on(:serial)
      chainsaw.destroy
      tool1.destroy
    end

  end

  context 'scopes' do
    before :all do
      @category = FactoryGirl.create(:category, name: 'Fake Category')
      @location = FactoryGirl.create(:location, name: 'Loaners')
      @app712 = FactoryGirl.create(:location, name: '712', vehicle: true, type: 'Vehicle')

      @chainsaw = FactoryGirl.create(:tool, name: 'Chainsaw', location_id: @app712.id, loaner: false)
      @generator = FactoryGirl.create(:tool, name: 'Generator', location_id: @app712.id, loaner: false)
      @blower = FactoryGirl.create(:tool, name: 'Blower', loaner: false)
      @loaner1 = FactoryGirl.create(:tool, name: 'loaner1', loaner: true, location_id: @location.id)
      @loaner2 = FactoryGirl.create(:tool, name: 'loaner2', loaner: true, location_id: @location.id)
    end

    it 'returns an array of tools by location, sort by name' do
      tools = Tool.location_group(@app712.name)
      expect(tools).to eq [@chainsaw, @generator]
    end
    it 'returns an array of loaner tools, sort by name' do
      tools = Tool.loaner_tools
      expect(tools).to eq [@loaner1, @loaner2]
    end

    it 'can swap tools between two locations' do
      app_params = {'apparatus' => {'relocate' => [@chainsaw.id], 'location' => @location.name, 'swap' => [@loaner1.id]},  :app => '712'}
      Tool.swap_tools(app_params)
      expect(@chainsaw.location.name).to eq 'Loaners'
      expect(@loaner1.location.name).to eq '712'
    end
    it 'can relocate tools to another location'

  end

end