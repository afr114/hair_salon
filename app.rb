require('sinatra')
require('sinatra/reloader')
require('./lib/client')
require('./lib/stylist')
also_reload('lib/**/*.rb')
require('pg')
require('pry')
require('launchy')

DB = PG.connect({:dbname => "hair_salon_test"})

get('/') do
  erb(:index)
end

get('/staff_members') do
  @stylists = Stylist.all()
  erb(:staff_members)
end

get('/staff_form') do
  erb(:staff_form)
end

post('/staff_members') do
  staff = Stylist.new({:name => params.fetch("name")})
  staff.save()
  redirect('/staff_members')
end

get('/staff/:id') do
  @staff = Stylist.find(params.fetch("id").to_i())
  erb(:staff)
end

patch("/staff/:id") do
  name = params.fetch("name")
  @staff = Stylist.find(params.fetch("id").to_i())
  @staff.update({:name => name})
  redirect('/staff_members')
end

delete('/staff/:id') do
  @staff = Stylist.find(params.fetch("id").to_i())
  @staff.delete()
  # @books = Book.all()
  redirect('/staff_members')
end

get('/clients') do
  @clients = Client.all()
  erb(:clients)
end

get('/client_form') do
  erb(:client_form)
end

post('/clients') do
  client = Client.new({:name => params.fetch("name")})
  client.save()
  redirect('/clients')
end

get('/client/:id') do
  @client = Client.find(params.fetch("id").to_i())
  erb(:client)
end

patch("/client/:id") do
  name = params.fclienttch("name")
  @client = Client.find(params.fetch("id").to_i())
  @client.update({:name => name})
  redirect('/clients')
end

delete('/client/:id') do
  @client = Client.find(params.fetch("id").to_i())
  @client.delete()
  # @books = Book.all()
  redirect('/clients')
end
