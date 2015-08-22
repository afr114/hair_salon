class Stylist
  attr_reader(:name, :id)

  define_method(:initialize) do |attributes|
    @name = attributes.fetch(:name)
    @id = attributes.fetch(:id, nil)
  end

  def self.all
    returned_names = DB.exec("SELECT * FROM stylists;")
    stylists = []
    returned_names.each() do |stylist|
      name = stylist.fetch("name")
      id = stylist.fetch("id").to_i()
      stylists.push(Stylist.new({:name => name, :id => id}))
    end
    stylists
  end

  def save
    result = DB.exec("INSERT INTO stylists (name) VALUES ('#{@name}') RETURNING id;")
    @id = result.first().fetch("id").to_i()
  end

  def ==(another_stylist)
    self.name().==(another_stylist.name()).&(self.id().==(another_stylist.id()))
  end


  def update(attr)
    @name = attr.fetch(:name)
    @id = self.id()
    DB.exec("UPDATE stylists SET name = '#{@name}' WHERE id = #{@id};")
  end

  def delete
    DB.exec("DELETE FROM stylists WHERE id = #{self.id()};")
  end

  def self.find(id)
    found_stylist = nil
    Stylist.all().each() do |stylist|
      if stylist.id().==(id)
        found_stylist = stylist
      end
    end
    found_stylist
  end

  def clients
    stylist_clients = []
    clients = DB.exec("SELECT * FROM clients WHERE stylists_id = #{id}")
    clients.each() do |client|
      name = client.fetch("name")
      stylist_id = client.fetch("stylists_id").to_i()
      id = client.fetch('id').to_i()
      stylist_clients.push(Client.new({:name => name, :stylists_id => stylists_id, :id => id}))
    end
    stylist_clients
  end

end #ends class
