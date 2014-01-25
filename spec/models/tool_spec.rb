require 'spec_helper'

describe Tool do

  context  'validations' do

    it 'is valid with a name, serial, model, location, category' do
      tool = Tool.new(
          name: 'chainsaws',
          serial: '9999999',
          model: 'Stihl 660',
          location: Location.new(name: 'Sta 72'),
          category: Category.new(name: 'Chainsaw')
      )
      expect(tool).to be_valid
    end
    it 'is invalid without a name' do
      expect(Tool.new(name: nil)).to have(1).errors_on(:name)
    end
    it 'is invalid without a serial' do
      expect(Tool.new(serial: nil)).to have(1).errors_on(:serial)
    end
    it 'is invalid without a model' do
      expect(Tool.new(model: nil)).to have(1).errors_on(:model)
    end
    it 'is invalid without a location' do
      expect(Tool.new(location: nil)).to have(1).errors_on(:location)
    end
    it 'is invalid without a category' do
      expect(Tool.new(category: nil)).to have(1).errors_on(:category)
    end
    it 'is invalid with a duplicate serial' do
      Tool.create(name: 'Chainsaws', serial: '12345', model: 'Stihl 044',
                  location: Location.new(name: 'Sta 72'),
                  category: Category.new(name: 'Chainsaw'))
      tool = Tool.new(
          name: 'chainsaws',
          serial: '12345',
          model: 'Stihl 660',
          location: Location.new(name: 'Sta 72'),
          category: Category.new(name: 'Chainsaw')
      )
      expect(tool).to have(1).errors_on(:serial)
    end

  end

  context 'scopes' do
    before :each do
      @location = Location.create(id: 1, name: 'Loaners', vehicle: false, type: 'Station')
      @chainsaw = Tool.create(name: 'chainsaw', serial: '12345',
                              model: 'Stihl 044', loaner: true,
                              location: Location.new(id: 2, name: 'Sta 71'),
                              category: Category.new(name: 'Chainsaws'))
      @generator = Tool.create(name: 'generator', serial: '54321',
                              model: 'Onan', loaner: true,
                              location: Location.new(id: 3, name: '712'),
                              category: Category.new(name: 'Generators'))
      @blower = Tool.create(name: 'blower', serial: '99999',
                              model: 'Supervac', loaner: false,
                              location: Location.find(3),
                              category: Category.new(name: 'Blowers'))
      @loaner1 = Tool.create(name: 'loanersaw1', serial: '88888',
                              model: 'Sthil 66', loaner: true,
                              location: @location, category: Category.find_by(name: 'Chainsaws'))
      @loaner2 = Tool.create(name: 'loanersaw2', serial: '77777',
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

  end

  context 'methods' do
    it 'can swap tools between two locations'
    it 'can relocate tools to another location'

  end



end