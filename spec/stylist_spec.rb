require('rspec')
require('stylist')
require('spec_helper')

describe(Stylist) do
  describe('#name') do
    it("returns the name of the stylist") do
      test_name = Stylist.new({:name => "Pewter Pompoms", :id => nil})
      expect(test_name.name()).to(eq("Pewter Pompoms"))
    end
  end

  describe('.all') do
    it('is empty at first') do
      expect(Stylist.all()).to(eq([]))
    end
  end

  describe('#save') do
    it('lets you save to the database') do
      test_stylist = Stylist.new({:name => "Paxter Pendergrass", :id => nil})
      test_stylist.save()
      expect(Stylist.all()).to(eq([test_stylist]))
    end
  end

  describe('#update') do
    it ('lets you update stylists in the database') do
      stylist = Stylist.new({:name => "Priscilla Prettydress", :id => nil})
      stylist.save()
      stylist.update({:name => "Pending Poopoodew", :id => nil})
      expect(stylist.name()).to(eq("Pending Poopoodew"))
    end
  end

  describe("#delete") do
    it('deletes a name from the database') do
      stylist = Stylist.new({:name => "Robert Redbear", :id => nil})
      stylist.save()
      stylist.delete()
      expect(Stylist.all()).to(eq([]))
    end
  end

  describe(".find") do
    it('returns a stylist by its ID') do
      test_stylist1 = Stylist.new({:name => "Susie Systemerror", :id => 1})
      test_stylist1.save()
      test_stylist2 = Stylist.new({:name => "Hal Holdover", :id => 2})
      test_stylist2.save()
      expect(Stylist.find(test_stylist2.id())).to(eq(test_stylist2))
    end
  end

end #ends Stylist spec
