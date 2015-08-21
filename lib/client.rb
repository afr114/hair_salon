class Client
  attr_reader(:name, :id)

  define_method(:initialize) do |attributes|
    @name = attributes.fetch(:name)
    @id = attributes.fetch(:id)
  end

  def self.all
    returned_names = DB.exec("SELECT * FROM clients;")
    clients = []
    returned_names.each() do |client|
      name = client.fetch("name")
      id = client.fetch("id").to_i()
      clients.push(Client.new({:name => name, :id => id}))
    end
    clients
  end

end #ends class
