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

  describe('#update') do
    it ('lets you update clients in the database') do
      client = Client.new({:name => "Priscilla Prettydress", :id => nil})
      client.save()
      client.update({:name => "Pending Poopoodew", :id => nil})
      expect(client.name()).to(eq("Pending Poopoodew"))
    end
  end

  describe("#delete") do
    it('deletes a name from the database') do
      client = Client.new({:name => "Robert Redbear", :id => nil})
      client.save()
      client.delete()
      expect(Client.all()).to(eq([]))
    end
  end

  describe(".find") do
    it('returns a client by its ID') do
      test_client1 = Client.new({:name => "Susie Systemerror", :id => 1})
      test_client1.save()
      test_client2 = Client.new({:name => "Hal Holdover", :id => 2})
      test_client2.save()
      expect(Client.find(test_client2.id())).to(eq(test_client2))
    end
  end

end #ends Client spec
