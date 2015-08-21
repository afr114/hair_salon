require('rspec')
require('client')
require('spec_helper')

describe(Client) do
  describe('#name') do
    it("returns the name of the client") do
      test_name = Client.new({:name => "Pewter Pompoms", :id => nil})
      expect(test_name.name()).to(eq("Pewter Pompoms"))
    end
  end

  describe('.all') do
    it('is empty at first') do
      expect(Client.all()).to(eq([]))
    end
  end
end #ends Client spec
