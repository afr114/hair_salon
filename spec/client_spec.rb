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

  describe('#save') do
    it('lets you save to the database') do
      test_client = Client.new({:name => "Paxter Pendergrass", :id => nil})
      test_client.save()
      expect(Client.all()).to(eq([test_client]))
    end
  end

end #ends Client spec
