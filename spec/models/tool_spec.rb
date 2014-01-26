require 'spec_helper'

describe Tool do

  it 'has a valid factory' do
    expect(build(:tool)).to be_valid
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
      create(:tool, serial: '12345')
      expect(build(:tool, serial: '12345')).to have(1).errors_on(:serial)
    end

  end

  context 'scopes' do
    before :each do
      @location = Location.create(id: 1, name: 'Loaners', vehicle: false, type: 'Station')
      @app712 = Location.create(id: 2, name: '712', vehicle: true, type: 'Vehicle')
      @chainsaw = Tool.create(id: 1, name: 'chainsaw', serial: '12345',
                              model: 'Stihl 044', loaner: true,
                              location: Location.new(id: 3, name: 'Sta 71'),
                              category: Category.new(name: 'Chainsaws'))
      @generator = Tool.create(id: 2, name: 'generator', serial: '54321',
                              model: 'Onan', loaner: true,
                              location: Location.find(2),
                              category: Category.new(name: 'Generators'))
      @blower = Tool.create(id: 3, name: 'blower', serial: '99999',
                              model: 'Supervac', loaner: false,
                              location: Location.find(2),
                              category: Category.new(name: 'Blowers'))
      @loaner1 = Tool.create(id: 4, name: 'loanersaw1', serial: '88888',
                              model: 'Sthil 66', loaner: true,
                              location: @location, category: Category.find_by(name: 'Chainsaws'))
      @loaner2 = Tool.create(id: 5, name: 'loanersaw2', serial: '77777',
                             model: 'Sthil 66', loaner: true,
                             location: @location, category: Category.find_by(name: 'Chainsaws'))
    end

    it 'returns an array of tools by location, sort by name' do
      tools = Tool.location_group('712')
      expect(tools).to eq [@blower, @generator]
    end
    it 'returns an array of loaner tools, sort by name' do
      tools = Tool.loaner_tools
      expect(tools).to eq [@loaner1, @loaner2]
    end

    it 'can swap tools between two locations' do
      app_params = {'apparatus'=>{'relocate'=>['2'], 'location'=>'Loaners', 'swap'=>['4']},  'app'=>'712'}
      Tool.swap_tools(app_params)
      expect(@generator.location.name).to eq 'Loaners'
      expect(@loaner1.location.name).to eq '712'
    end
    it 'can relocate tools to another location'

  end



end